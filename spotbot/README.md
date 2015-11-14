### gordonchan/spotbot

A Dockerized Ruby script to periodically check New Zealand's [electricity prices](http://www.electricityinfo.co.nz/) and tweets when they are high.

Currently operating the Twitter handle [nzhay250](https://twitter.com/nzhay250)

### Example Usage

```
$ docker run -d --env-file=.env gordonchan/spotbot
```

#### Environment Variables
This image expects the following environment variables to be set to allow the container to interface with Twitter:

`consumer_key`, `consumer_secret`, `access_token`, `access_token_secret`

You can also set an optional environment variable `price_threshold` to control the price level to warrant a tweet.

#### --env-file
The easiest way to pass environment variables to the container is to define them in a file:

```
consumer_key=<my sekret>
consumer_secret=<my sekret>
access_token=<my sekret>
access_token_secret=<my sekret>
price_threshold=100
```

And use the `--env-file` option when starting the container:

```
$ docker run -d --env-file=.env gordonchan/spotbot
```

#### License

Copyright (c) 2015 Gordon Chan. Released under the MIT License. It is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/gchan/dockerfiles/blob/master/LICENSE.txt) file.