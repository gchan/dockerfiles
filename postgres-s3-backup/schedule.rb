ENV.each do |name, value|
  env name, value
end

set :output, "/var/log/cron.log"

every 1.day, at: '3:00 pm' do
  command "/usr/local/bundle/bin/backup perform --trigger backup --config-file /backup/config.rb"
end
