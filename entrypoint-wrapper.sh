#!/bin/sh
set -e

echo "Fixing volume permissions..."
chown -R nobody:nobody /tmp/kx/data
echo "Permissions fixed."

# Używamy 'su' zamiast 'su-exec', ponieważ 'su' jest zawsze dostępne.
# 'exec' na początku zastępuje proces skryptu procesem 'su', co jest dobrą praktyką.
# 'su -s /bin/sh nobody -c 'exec "$@"'': Uruchamia polecenie przekazane jako argumenty ("$@") jako użytkownik 'nobody'.
exec su -s /bin/sh nobody -c 'exec "$@"'
