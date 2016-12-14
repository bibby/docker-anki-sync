[sync_app]
host = {{ANKI_ALLOWED_HOSTS}}
port = 27701
ssl = {% if ANKI_SSL_CERT %}true
certfile = {{ANKI_SSL_CERT|default('')}}
keyfile = {{ANKI_SSL_KEY|default('')}}
{% else %}false{% endif %}
data_root = /etc/ankisyncd/collections
base_url = /sync/
base_media_url = /msync/
auth_db_path = ./auth.db
session_db_path = /etc/ankisyncd/session.db
auth_db_path = /etc/ankisyncd/auth.db
