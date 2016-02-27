# encoding: utf-8

Model.new(:backup, 'Backup Database') do
  database PostgreSQL do |db|
    db.name               = ENV["POSTGRES_DB"]
    db.username           = ENV["POSTGRES_USER"]
    db.password           = ENV["POSTGRES_PASSWORD"]
    db.host               = ENV["POSTGRES_HOST"]
    db.port               = ENV["POSTGRES_POST"]
    # db.socket             = "/tmp/pg.sock"

    # db.skip_tables        = ["skip", "these", "tables"]
    # db.only_tables        = ["only", "these", "tables"]
    # db.additional_options = ["-xc", "-E=utf8"]
  end

  store_with S3 do |s3|
    s3.access_key_id     = ENV["AWS_ACCESS_KEY_ID"]
    s3.secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
    # s3.use_iam_profile = true

    s3.encryption        = :aes256
    s3.region            = ENV["S3_REGION"]
    s3.bucket            = ENV["S3_BUCKET"]
    s3.path              = ENV["S3_PATH"]
  end

  store_with Local do |local|
    local.path       = "/backups/"
    local.keep       = 14
  end

  compress_with Gzip

  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.from                 = ENV["MAIL_FROM"]
    mail.to                   = ENV["MAIL_TO"]
    mail.address              = ENV["MAIL_ADDRESS"]
    mail.port                 = ENV["MAIL_PORT"]
    mail.domain               = ENV["MAIL_DOMAIN"]
    mail.user_name            = ENV["MAIL_USER_NAME"]
    mail.password             = ENV["MAIL_PASSWORD"]
    mail.authentication       = ENV["MAIL_AUTHENTICATION"]
    mail.encryption           = ENV["MAIL_ENCRYPTION"]
  end
end
