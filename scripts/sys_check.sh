#!/usr/bin/env bash

mkdir -p logs
LOG="logs/sys_check.log"

echo "=== Süsteemi kontroll: $(date) ===" | tee -a "$LOG"
./scripts/system_info.sh | tee -a "$LOG"
./scripts/disk_check.sh | tee -a "$LOG"
./scripts/service_check.sh cron | tee -a "$LOG"
