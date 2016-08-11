### gordonchan/ghost-mailgun

[![](https://images.microbadger.com/badges/image/gordonchan/ghost-mailgun.svg)](http://microbadger.com/images/gordonchan/ghost-mailgun "Get your own image badge on microbadger.com")

The official [ghost:latest](https://hub.docker.com/_/ghost/) with a customised [config.js](https://github.com/gchan/dockerfiles/blob/master/ghost-mailgun/config.js) to allow easy configuration of the [Mailgun](https://mailgun.com) credentials and blog URL through environment variables.

### Example Usage

```
$ docker run -d --env-file=.env gordonchan/ghost-mailgun
```

#### Environment Variables
This image expects the following environment variables to be set.

`NODE_ENV`, `MAILGUN_USER`, `MAILGUN_PASS`, `GHOST_URL`

The container will still function without any of the above set, but Ghost will be operating in development mode with default settings.

#### --env-file
The easiest way to pass environment variables to the container is to define them in a file:

```
NODE_ENV=production
MAILGUN_USER=<my sekret>
MAILGUN_PASS=<my sekret>
GHOST_URL=https://www.example.com
```

And use the `--env-file` option when starting the container:

```
$ docker run -d --env-file=.env gordonchan/ghost-mailgun
```

#### License

Copyright (c) 2015 Gordon Chan. Released under the MIT License. It is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/gchan/dockerfiles/blob/master/LICENSE.txt) file.

[![Analytics](https://ga-beacon.appspot.com/UA-70790190-2/dockerfiles/ghost-mailgun/README.md?flat)](https://github.com/igrigorik/ga-beacon)
