### gordonchan/nginx-unicorn-rails

[![](https://images.microbadger.com/badges/image/gordonchan/nginx-unicorn-rails.svg)](http://microbadger.com/images/gordonchan/nginx-unicorn-rails "Get your own image badge on microbadger.com")

The official [nginx](https://hub.docker.com/_/nginx/) with a customised [nginx.conf](https://github.com/gchan/dockerfiles/blob/master/nginx-unicorn-rails/nginx.conf) designed for reverse proxying (with SSL support) to a container running a [unicorn](https://unicorn.bogomips.org/) web server.

The [nginx.conf](https://github.com/gchan/dockerfiles/blob/master/nginx-unicorn-rails/nginx.conf) file is based on the [nginx example file](http://unicorn.bogomips.org/examples/nginx.conf) provided by unicorn.

_I have made modifications for my selfish needs but it should be generic enough for general use._

#### Notes
* This image assumes the hostname `app1` and `app2` will connect to the containers running the unicorn servers. Basic load balancing is configured, however it is perfectly okay to have only one unicorn server container running.
* This image assumes the SSL certificate and key files are located at `/etc/nginx/certs/fullchain.pem` and `/etc/nginx/certs/privkey.pem` on the container respectively.
* The SSL cipher suite is the 'moderate' profile cipher suite recommended by [Mozilla](https://mozilla.github.io/server-side-tls/ssl-config-generator/?server=nginx-1.9.5&openssl=1.0.1e&hsts=yes&profile=intermediate).
* The SSL cipher suite disables non-EC Diffie-Hellman key exchange to avoid the need to generate a Diffie-Hellman group. For more information visti: https://blog.cloudflare.com/logjam-the-latest-tls-vulnerability-explained/. In a future update, I may write a `entrypoint.sh` to generate a DH group in the container.
* For connections coming from CloudFlare, preserve the originating IP of the visitor.

#### License

Copyright (c) 2016 Gordon Chan. Released under the MIT License. It is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/gchan/dockerfiles/blob/master/LICENSE.txt) file.

[![Analytics](https://ga-beacon.appspot.com/UA-70790190-2/dockerfiles/nginx-unicorn-rails/README.md?flat)](https://github.com/igrigorik/ga-beacon)
