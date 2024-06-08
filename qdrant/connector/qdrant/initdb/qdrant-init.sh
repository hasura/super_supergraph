#!/bin/sh

SNAPSHOT_DIR="/snapshots"
SNAPSHOT_CMD=""

for snapshot in "$SNAPSHOT_DIR"/*; do
  if [ -f "$snapshot" ]; then
    SNAPSHOT_NAME=$(basename "$snapshot" .snapshot)
    SNAPSHOT_CMD="$SNAPSHOT_CMD --snapshot $snapshot:$SNAPSHOT_NAME"
  fi
done

exec ./qdrant $SNAPSHOT_CMD --force-snapshot
