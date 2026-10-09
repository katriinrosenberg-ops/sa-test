#!/usr/bin/env bash

SRC_DIR="testdata/source"
BACKUP_DIR="backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVE="${BACKUP_DIR}/backup_${TIMESTAMP}.tar.gz"

mkdir -p "$BACKUP_DIR"

if tar -czf "$ARCHIVE" -C "$SRC_DIR" . &>/dev/null; then
    if gzip -t "$ARCHIVE" &>/dev/null && tar -tzf "$ARCHIVE" &>/dev/null; then
        echo "Varukoopia valmis: $ARCHIVE"
        exit 0
    else
        echo "Viga: Loodud arhiiv on vigane!"
        exit 1
    fi
else
    echo "Viga varukoopia loomisel!"
    exit 1
fi

