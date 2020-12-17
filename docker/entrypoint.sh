#!/bin/bash

# Rails-specific issue, deletes a pre-existing server, if it exists

set -e

if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi

exec "$@"
