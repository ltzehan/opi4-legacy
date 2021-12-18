#!/bin/bash

hrdline() { printf '\n%30s\n' | tr ' ' =; }
hrline() { printf '\n%30s\n' | tr ' ' -; }
banner() { hrdline; printf "$1"; hrdline; }
pcmd() { printf "$1\n"; $2; }

# MCP251x-related logs
banner 'CAN Bus (mcp251x)'
pcmd 'mcp251x dmesg:' dmesg | grep mcp251x
hrline
pcmd 'Interrupts' "grep mcp251x /proc/interrupts"
hrline
pcmd 'SocketCAN interface' "ip link show can0"

# Camera-related logs
banner 'Camera/RKISP'
pcmd 'ov13850 dmesg:' dmesg | grep 0v13850
hrline
pcmd 'rkisp dmesg:' dmesg | grep rkisp

