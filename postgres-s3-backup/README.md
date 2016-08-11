### gordonchan/postgres-s3-backup

[![](https://images.microbadger.com/badges/image/gordonchan/postgres-s3-backup.svg)](http://microbadger.com/images/gordonchan/postgres-s3-backup "Get your own image badge on microbadger.com")

A Docker image designed to make daily backups of a Postgres database at 3pm UTC (3am NZST). Backups are stored locally on the container but are also uploaded to [Amazon S3](https://aws.amazon.com/s3/). Email notifications are delivered on every backup attempt.

[backup](https://backup.github.io/backup) is used to manage backups and [whenever](https://github.com/javan/whenever) is used to create the cron job. The main backup configuration file can be found [here](https://github.com/gchan/dockerfiles/blob/master/postgres-s3-backup/models/backup.rb).

_This Docker image was created for my own selfish needs. It could be useful for others or be used as an example to create your own version._

### Environment variables
The following environment variables are expected to be set:

#### Postgres
* `POSTGRES_DB`
* `POSTGRES_USER`
* `POSTGRES_PASSWORD`
* `POSTGRES_HOST`
* `POSTGRES_POST`

#### AWS
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `S3_REGION`
* `S3_BUCKET`
* `S3_PATH`

#### SMTP Email
* `MAIL_FROM`
* `MAIL_TO`
* `MAIL_ADDRESS`
* `MAIL_PORT`
* `MAIL_DOMAIN`
* `MAIL_USER_NAME`
* `MAIL_PASSWORD`
* `MAIL_AUTHENTICATION`
* `MAIL_ENCRYPTION`

#### License

Copyright (c) 2016 Gordon Chan. Released under the MIT License. It is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/gchan/dockerfiles/blob/master/LICENSE.txt) file.

[![Analytics](https://ga-beacon.appspot.com/UA-70790190-2/dockerfiles/postgres-s3-backup/README.md?flat)](https://github.com/igrigorik/ga-beacon)
