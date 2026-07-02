#!/bin/sh

echo "Setting up Android cloud service account:"

echo ""

echo "Configuring cloud service account..."

echo ""

mkdir -p ./fastlane/secrets/

printf '%s\n' "$CLOUD_SERVICE_ACCOUNT_FILE_CONTENT" > ./fastlane/secrets/google-play-service-account.json

echo "Done!"
