#!/usr/bin/env ruby

require "wits"
require "twitter"
require "yaml/store"
require "logger"
require 'dotenv'

Signal.trap("SIGINT") { exit }
Dotenv.load

class SpotBot
  attr_reader :twitter, :threshold, :store, :prices, :logger

  def initialize
    @logger = Logger.new(STDOUT)
    @store = SpotStore.new
    @twitter = SpotBotTwitter.new(logger: @logger)
    $stdout.sync = true

    if ENV["price_threshold"]
      @threshold = ENV["price_threshold"].to_i
    else
      @threshold = 250
    end
  end

  def perform
    @logger.debug "SpotBot executing"

    @prices = SpotBotPrice.get_prices

    tweet_price_update
    update_latest_time

    @logger.debug "SpotBot executed"
  end

  private

  def tweet_price_update
    return unless new_price?

    message = generate_message(price: prices.price, time: prices.time)

    if prices.price >= threshold
      twitter.tweet message
    elsif prices.last_price && prices.last_price >= threshold
      twitter.tweet "Peace restored. #{message}"
    end
  end

  def generate_message(price:, time:)
    formated_time = prices.time.strftime "%a, %d %B %Y at %I:%M %P"

    formatted_price       = sprintf('%.2f', price)
    formatted_price_cents = sprintf('%.2f', price / 10.0)

    "5-min electricity price is $#{formatted_price} per MWh (#{formatted_price_cents} c/kWh). #{formated_time}."
  end

  def new_price?
    store.read != prices.time
  end

  def update_latest_time
    store.write(value: prices.time)
  end
end

class SpotStore
  attr_reader :store

  def initialize(file_name: "latest_time.yml")
    @store = YAML::Store.new(file_name)
  end

  def write(key: :latest_time, value:)
    store.transaction do
      store[:latest_time] = value
    end
  end

  def read(key: :latest_time)
    store.transaction(true) do
      store[key]
    end
  end
end

class SpotBotPrice
  attr_reader :price, :last_price, :time, :trading_period, :grid_point

  def self.get_prices
    self.new(Wits.hay_five_minute_prices)
  end

  def initialize(data)
    @price          = data[:prices][-1][:price]
    server_time     = data[:prices][-1][:time]
    @time           = TZInfo::Timezone.get('Pacific/Auckland').utc_to_local(server_time)
    @trading_period = data[:prices][-1][:trading_period]
    @grid_point     = data[:prices][-1][:grid_point]

    @last_price = data[:prices][-2].fetch(:price, nil)
  end
end

class SpotBotTwitter
  attr_reader :twitter

  def initialize(logger: nil)
    @logger = logger

    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["consumer_key"]
      config.consumer_secret     = ENV["consumer_secret"]
      config.access_token        = ENV["access_token"]
      config.access_token_secret = ENV["access_token_secret"]
    end
  end

  def tweet(message)
    twitter.update(message)
    @logger.info(message) if @logger
  end
end

class SpotChecker
  def self.check
    credentials = %w(consumer_key consumer_secret access_token access_token_secret)
    missing_credentials = credentials.reject { |key| ENV[key] }

    if missing_credentials.any?
      puts "Missing the following environment variable(s): #{missing_credentials}"
      exit
    end

    twitter = SpotBotTwitter.new
    begin
      twitter.twitter.user("twitter")
    rescue => error
      puts error.message
      puts "Invalid Twitter credentials"
      exit
    end
  end
end

SpotChecker.check

while true
  spotbot = SpotBot.new
  begin
    spotbot.perform
  rescue => error
    spotbot.logger.warn(error.message)
  ensure
    sleep(60)
  end
end
