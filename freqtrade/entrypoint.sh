#!/bin/bash

CONFIG_PATH="${APP_DATA_DIR}/user_data/config.json"

if [ ! -d "${APP_DATA_DIR}/user_data" ]; then
    echo "Creating user directory structure..."
    freqtrade create-userdir --userdir user_data
fi

if [ ! -f "$CONFIG_PATH" ]; then
    echo "Config file not found. Creating default config.json..."
    freqtrade new-config --config "$CONFIG_PATH"
else
    echo "Config file exists. Skipping creation."
fi

exec freqtrade trade --logfile "${APP_DATA_DIR}/user_data/logs/freqtrade.log" \
                     --db-url sqlite:///${APP_DATA_DIR}/user_data/tradesv3.sqlite \
                     --config "$CONFIG_PATH" --strategy SampleStrategy