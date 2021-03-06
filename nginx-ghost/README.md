### gordonchan/nginx-ghost

[![](https://images.microbadger.com/badges/image/gordonchan/nginx-ghost.svg)](http://microbadger.com/images/gordonchan/nginx-ghost "Get your own image badge on microbadger.com")

The official [nginx:latest](https://hub.docker.com/_/nginx/) with a customised [default.conf](https://github.com/gchan/dockerfiles/blob/master/nginx-ghost/default.conf) designed for reverse proxying to a container running [ghost](https://ghost.org/).

Use [nginx-ssl-ghost](https://github.com/gchan/dockerfiles/blob/master/nginx-ssl-ghost) for the SSL version.

### Example Usage

```
$ docker run -d --link my_ghost_container:ghost gordonchan/nginx-ghost
```

#### Assumptions

This image assumes the hostname `ghost` will connect to the container running the ghost application. If this is not the correct name, you will need to create an alias as described in the example above.

We also assume the default ghost port is exposed (2368).

#### License

Copyright (c) 2015 Gordon Chan. Released under the MIT License. It is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/gchan/dockerfiles/blob/master/LICENSE.txt) file.

[![Analytics](https://ga-beacon.appspot.com/UA-70790190-2/dockerfiles/nginx-ghost/README.md?flat)](https://github.com/igrigorik/ga-beacon)
