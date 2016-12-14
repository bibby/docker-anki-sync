#!/bin/bash

src=$(readlink -f $(dirname "${BASH_SOURCE[0]}"))
export PYTHONPATH="${src}:${src}/anki-bundled"

log() {
  echo "$@" >&2
}

[ -f ankisyncd.conf.tpl ] && {
    log "templating configuration"
    envtpl ankisyncd.conf.tpl
}

cd $(readlink -f $(dirname "${BASH_SOURCE[0]}"))

[ -n "${ANKI_USER}" ] && {
  log "adding user"
  ./ankisyncctl.py adduser "${ANKI_USER}" <<< "${ANKI_PASSWORD}" 2>/dev/null
  [ "$?" != "0" ] && {
    ./ankisyncctl.py passwd "${ANKI_USER}" <<< "${ANKI_PASSWORD}"
  }
}

log "starting server"

exec python ankisyncd/sync_app.py
