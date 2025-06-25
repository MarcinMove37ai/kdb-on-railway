# Użyj oficjalnej bazy z zainstalowanym KDB.AI
FROM ghcr.io/marcinmove37ai/kdb-on-railway:latest

# Przełącz się na użytkownika root, aby ustawić uprawnienia
USER root

# Skopiuj wrapper i skrypt startowy
COPY entrypoint-wrapper.sh /usr/local/bin/entrypoint-wrapper.sh
COPY entrypoint.sh /entrypoint.sh

# Nadanie uprawnień do uruchamiania
RUN chmod +x /usr/local/bin/entrypoint-wrapper.sh /entrypoint.sh

# Ustaw ENTRYPOINT z wrapperem i uruchomieniem serwera
ENTRYPOINT ["/usr/local/bin/entrypoint-wrapper.sh", "/bin/sh", "/entrypoint.sh"]
