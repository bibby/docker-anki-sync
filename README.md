Self-hosted AnkiWeb sync server docker container.

Uses the `ndl-patches` branch of [jdoe0/ankisyncd](https://github.com/jdoe0/ankisyncd/tree/ndl-patches),
which itself is forked from [dsnopek/anki-sync-server](https://github.com/dsnopek/anki-sync-server).

I personally view this as better than [lertsenem/anki-server](https://hub.docker.com/r/lertsenem/anki-server/),
because it contains a [critical patch](https://github.com/dsnopek/anki-sync-server/issues/47#issuecomment-256486714)
and doesn't run dumb Alpine.

---

See `docker-compose.yml` for a example. Also note that @jdoe0 also added SSL support, which this example does not use.
To enable SSL supply `ANKI_SSL_CERT` and `ANKI_SSL_KEY` variables and add those to your container.

## 頑張れよ!
