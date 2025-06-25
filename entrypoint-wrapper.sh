#!/bin/sh
set -e

echo "🔧 Fixing volume permissions..."
chown -R nobody:nobody /tmp/kx/data
echo "✅ Permissions fixed."

echo "🔁 Przełączam na użytkownika nobody i uruchamiam serwer KDB.AI..."

# Uruchom jako 'nobody' bez dodatkowych argumentów
exec su -s /bin/sh nobody -c "/entrypoint.sh"
