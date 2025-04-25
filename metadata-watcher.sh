#!/bin/bash
# metadata-watcher.sh [demo version]
# Purpose: Watch an XML file for metadata changes, extract values, and write a simplified JSON for public clients.
# Full implementation intentionally omitted.

# 🚧 Placeholder Paths
XML_FILE="/input/folder/playing.xml"
JSON_FILE=/path/to/your/status-json.xsl"
LOG_DIR="/path/to/your/xml-parser"

# 🔒 Disabled alert handler – contact author for full logic
TELEGRAM_SCRIPT="__not_included.sh"

# Create log directory
mkdir -p "$LOG_DIR"

log_message() {
  echo "[log] $1" >> "$LOG_DIR/watcher.log"
}

# 🔧 TODO: Implement XML write time check (security-critical)
check_xml_time() {
  log_message "XML time check stub – contact author for full version."
  return 0
}

# ⚠️ Core functionality replaced with stub
update_json() {
  log_message "Stub update triggered – no real parsing performed."

  # Simulated output
  cat <<EOF > "$JSON_FILE"
{
  "icestats": {
    "source": [
      {
        "title": "Placeholder - Unknown Artist"
      }
    ]
  }
}
EOF
  log_message "Stub JSON written: $JSON_FILE"
}

# Sanity checks (stubbed)
log_message "Launching demo watcher…"
log_message "WARNING: This version does not parse real XML."

# 👁️ Main loop – no actual inotify integration here
while true; do
  sleep 60
  update_json
done
