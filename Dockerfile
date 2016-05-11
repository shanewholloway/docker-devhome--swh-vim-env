FROM shane/devtools-nix:core-xenial

USER "root"
WORKDIR "/root"
RUN . /devtools/set-path \
 && mkdir -p .vim/ \
 && curl -sSL https://bitbucket.org/shanewholloway/swh-vim-env/get/tip.tar.gz \
     | tar -xz --strip=1 --directory=.vim/ \
 && echo "source /devtools/set-path" >> .zshenv

RUN . /devtools/set-path \
 && TERM=dumb  zsh .vim/bootstrap.sh

ENTRYPOINT ["/devtools/enter"]
CMD ["zsh", "-l"]

MAINTAINER Shane Holloway <shane.holloway@ieee.org>
# TO IMAGE shane/devhome.swh-vim-env:xenial
