#!/bin/bash
# Fetch data from your API
# Replace with your values

API_URL="https://your-api.com"
RESOURCE_ID="123"
USER="your-username"
PASS="your-password"
LIMIT=400

curl -s -u "$USER:$PASS" "$API_URL/api/resource/$RESOURCE_ID/items?limit=$LIMIT"
