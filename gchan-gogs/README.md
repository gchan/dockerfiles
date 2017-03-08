### gordonchan/gchan-gogs

[![](https://images.microbadger.com/badges/image/gordonchan/gchan-gogs.svg)](http://microbadger.com/images/gordonchan/gchan-gogs "Get your own image badge on microbadger.com")

A Docker image of [Gogs](https://gogs.io/), a self-hosted Git service, preconfigured for private use. Includes a custom [app.ini](https://github.com/gchan/dockerfiles/blob/master/gchan-gogs/app.ini) configured for my use (can be modified when application is first accessed).

_This Docker image was created for my own selfish needs. It could be useful for others or be used as an example to create your own version._

Usage information available on Gogs [GitHub](https://github.com/gogits/gogs/tree/master/docker#docker-for-gogs). Configuration [cheat sheet](https://gogs.io/docs/advanced/configuration_cheat_sheet) is a useful reference.

## Features (configuration options)

* Disable registration
* Must be signed in to view anything
* Disable Gravatar and Federated Avatar
* sqlite3 DB - no external dependencies :)
* Force private repositories
* robots.txt to prevent crawlers and indexers

#### License

Copyright (c) 2017 Gordon Chan. Released under the MIT License. It is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/gchan/dockerfiles/blob/master/LICENSE.txt) file.

[![Analytics](https://ga-beacon.appspot.com/UA-70790190-2/dockerfiles/gchan-gogs/README.md?flat)](https://github.com/igrigorik/ga-beacon)
