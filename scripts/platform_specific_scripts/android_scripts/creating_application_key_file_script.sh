#!/bin/sh

echo "Create application key file:"

echo ""

echo "Creating application key file..."

echo ""

echo $APPLICATION_kEY_FILE_CONTENT | base64 -d > ./android/app/application-key.jks

echo "Done!"
