# Etap 1: Użyj obrazu, który umieściłeś w swoim rejestrze ghcr.io
FROM ghcr.io/marcinmove37ai/kdb-on-railway:latest

# Etap 2: Skonfiguruj skrypt pośredniczący (wrapper)
# Musimy na chwilę przełączyć się na użytkownika root, aby móc kopiować pliki i zmieniać uprawnienia
USER root

# Skopiuj nasz nowy skrypt do obrazu
COPY entrypoint-wrapper.sh /usr/local/bin/entrypoint-wrapper.sh

# Nadaj mu uprawnienia do uruchamiania
RUN chmod +x /usr/local/bin/entrypoint-wrapper.sh

# Ustaw nasz skrypt jako nowy punkt wejścia (Entrypoint).
# Oryginalny entrypoint ("/bin/bash", "/entrypoint.sh") zostanie przekazany do niego jako argumenty ("$@").
ENTRYPOINT ["/usr/local/bin/entrypoint-wrapper.sh", "/bin/bash", "/entrypoint.sh"]
