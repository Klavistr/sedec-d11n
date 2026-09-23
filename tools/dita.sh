#!/bin/sh
set -eu

if ! command -v java >/dev/null 2>&1; then
  for java_home_candidate in /opt/homebrew/opt/openjdk /usr/local/opt/openjdk; do
    if [ -x "$java_home_candidate/bin/java" ]; then
      JAVA_HOME=$java_home_candidate
      export JAVA_HOME
      PATH="$JAVA_HOME/bin:$PATH"
      export PATH
      break
    fi
  done
fi

if ! command -v java >/dev/null 2>&1; then
  echo "error: Java 17 or newer was not found." >&2
  echo "Install it with 'brew install openjdk' or set JAVA_HOME." >&2
  exit 1
fi

if [ -n "${DITA_OT_DIR:-}" ] && [ -x "$DITA_OT_DIR/bin/dita" ]; then
  dita_command=$DITA_OT_DIR/bin/dita
elif command -v dita >/dev/null 2>&1; then
  dita_command=$(command -v dita)
elif [ -x /opt/homebrew/opt/dita-ot/bin/dita ]; then
  dita_command=/opt/homebrew/opt/dita-ot/bin/dita
elif [ -x /usr/local/opt/dita-ot/bin/dita ]; then
  dita_command=/usr/local/opt/dita-ot/bin/dita
else
  echo "error: DITA-OT was not found." >&2
  echo "Install it with 'brew install dita-ot' or set DITA_OT_DIR." >&2
  exit 1
fi

exec "$dita_command" "$@"
