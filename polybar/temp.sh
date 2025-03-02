#!/bin/bash
temp=$(sensors | awk '/Core 0/ {print $3}')
temp_value=$(echo "$temp" | awk -F'[+.]' '{print $2}')
echo "$temp_value°C"
