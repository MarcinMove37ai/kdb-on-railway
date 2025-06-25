#!/bin/sh
set -e

# Ten skrypt uruchamia się jako root.
# Nadajemy użytkownikowi 'nobody' prawa do zapisu na podłączonym wolumenie.
echo "Fixing volume permissions..."
chown -R nobody:nobody /tmp/kx/data
echo "Permissions fixed."

# Przekazujemy kontrolę do oryginalnego skryptu startowego,
# ale uruchamiamy go już jako użytkownik 'nobody'.
# 'exec' zastępuje obecny proces, co jest dobrą praktyką.
exec su-exec nobody "$@"
