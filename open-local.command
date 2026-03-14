#!/bin/zsh

set -euo pipefail

cd "$(dirname "$0")"

PORT=18765
LOG_FILE="/tmp/yt-loop-http.log"

if ! lsof -iTCP:$PORT -sTCP:LISTEN -t >/dev/null 2>&1; then
  python3 -m http.server "$PORT" >"$LOG_FILE" 2>&1 &
  sleep 1
fi

open "http://127.0.0.1:$PORT/index.html"
