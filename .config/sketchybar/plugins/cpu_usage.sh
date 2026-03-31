#!/bin/bash

CPU_PERCENT=$(ps -A -o %cpu | awk '{sum+=$1} END {printf "%.0f", sum}')

CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)

CPU_PERCENT=$((CPU_PERCENT / CORE_COUNT))

sketchybar --set "$NAME" label="${CPU_PERCENT}%"

# Get total CPU usage (user + system)

# CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
# CPU_INFO=$(ps -eo pcpu,user)
# CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
# CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
# CPU_PERCENT="$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')"
#
# sketchybar --set "$NAME" label="${CPU_PERCENT}%"
