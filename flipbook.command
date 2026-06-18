#!/bin/bash
# Double-click to launch the Flipbook maker.
# Serves this folder on localhost (pdf.js needs http, not file://) and opens it.
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR" || exit 1
PORT=8500
echo ""
echo "  Flipbook  →  http://localhost:$PORT"
echo "  Keep this window open. Close it to stop the maker."
echo ""
( sleep 0.8; open "http://localhost:$PORT/index.html" ) &
exec python3 -m http.server "$PORT"
