#!/usr/bin/env bash
# Skript: scripts/get-plantuml.sh
# Verwendung: bash scripts/get-plantuml.sh
set -euo pipefail

VERSION="${PLANTUML_VERSION:-1.2024.2}"
DEST="lib"
JAR="$DEST/plantuml.jar"
URL="https://repo1.maven.org/maven2/net/sourceforge/plantuml/plantuml/${VERSION}/plantuml-${VERSION}.jar"

mkdir -p "$DEST"
echo "Downloading plantuml ${VERSION} -> ${JAR} ..."
curl -fLS --retry 3 -o "$JAR" "$URL"
echo "Downloaded."

# optional: füge dem .gitignore-Eintrag hinzu, falls nicht vorhanden
GITIGNORE=".gitignore"
ENTRY="tools/plantuml/"
if [ -f "$GITIGNORE" ]; then
  grep -qxF "$ENTRY" "$GITIGNORE" || echo "$ENTRY" >> "$GITIGNORE"
else
  echo "$ENTRY" > "$GITIGNORE"
fi

# Beispiel: prüfe Erfolg
if [ -s "$JAR" ]; then
  echo "OK: $JAR vorhanden."
else
  echo "Fehler: $JAR ist leer oder fehlt." >&2
  exit 1
fi

# Optional: Hinweise für CI caching (GitHub Actions)
# Cache-Pfad: tools/plantuml/
# Beispiel-Action: actions/cache mit path: tools/plantuml/
