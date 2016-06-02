FROM ubuntu:16.04
MAINTAINER Paweł Wiechowski
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:hvr/ghc
RUN apt-get update
RUN apt-get install -y cabal-install-1.22 ghc-7.10.3
ADD hterm.cabal .
ADD Main.hs .
ENV PATH "/usr/bin:\$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:\$PATH"
RUN /opt/cabal/1.22/bin/cabal update
RUN /opt/cabal/1.22/bin/cabal install
CMD ["./dist/build/hterm/hterm"]

