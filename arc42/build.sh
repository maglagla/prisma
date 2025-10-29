#!/bin/zsh

set -e  # Abbrechen bei Fehlern

# Verzeichnisse anpassen
DIAGRAM_DIR="diagrams"
DOCS_DIR="docs"
OUTPUT_FILE="prisma-architecture.pdf"

echo "🧩 Schritt 1: Diagramme rendern..."
if [ -d "$DIAGRAM_DIR" ]; then
  java -Djava.awt.headless=true -jar ./lib/plantuml.jar -tsvg "$DIAGRAM_DIR"/*.puml
else
  echo "⚠️ Kein Diagrammverzeichnis gefunden: $DIAGRAM_DIR"
fi

echo "📄 Schritt 2: Markdown in PDF konvertieren..."
pandoc $DOCS_DIR/*.md \
  --from markdown \
  --to pdf \
  --pdf-engine=tectonic \
  --metadata title="Prisma Architecture (arc42)" \
  --metadata author="Markus Glagla" \
  --resource-path=$DIAGRAM_DIR \
  --output $OUTPUT_FILE

echo "✅ PDF erzeugt: $OUTPUT_FILE"

