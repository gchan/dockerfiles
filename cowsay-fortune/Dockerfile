FROM docker/whalesay:latest
MAINTAINER Gordon Chan <github.com/gchan>

RUN apt-get -y update && apt-get install -y fortunes

CMD /usr/games/fortune -a | cowsay
