#!/bin/bash

CONFIG_PATH="${APP_DATA_DIR}/user_data/config.json"

if [ ! -f "$CONFIG_PATH" ]; then
    echo "Config file not found. Creating default config.json..."
    freqtrade create-userdir --userdir user_data
    freqtrade new-config --config "$CONFIG_PATH"
else
    echo "Config file exists. Skipping creation."
fi

freqtrade trade --logfile "${APP_DATA_DIR}/user_data/logs/freqtrade.log" \
                --db-url sqlite:///${APP_DATA_DIR}/user_data/tradesv3.sqlite \
                --config "$CONFIG_PATH" --strategy SampleStrategy