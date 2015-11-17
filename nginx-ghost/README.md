### gordonchan/nginx-ghost

The official [nginx:latest](https://hub.docker.com/_/nginx/) with a customised [default.conf](https://github.com/gchan/dockerfiles/blob/master/nginx-ghost/default.conf) designed for reverse proxying to a container running [ghost](https://ghost.org/).

### Example Usage

```
$ docker run -d --link my_ghost_container:ghost gordonchan/nginx-ghost
```

#### Assumptions

This image assumes the hostname `ghost` will connect to the container running the ghost application. If this is not the correct name, you will need to create an alias as described in the example above. Please note this form of linking is expected to be deprecated and removed in favour of Docker networks.

We also assume the default ghost port is exposed (2368).

#### License

Copyright (c) 2015 Gordon Chan. Released under the MIT License. It is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/gchan/dockerfiles/blob/master/LICENSE.txt) file.