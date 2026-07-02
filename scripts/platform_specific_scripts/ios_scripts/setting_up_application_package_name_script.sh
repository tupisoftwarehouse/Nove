#!/bin/sh

echo "Set up application package name:"

echo ""

echo "Configuring iOS application package name..."

echo ""

dart run change_app_package_name:main org.tupi.Nove --ios > /dev/null 2>&1

echo "Done!"
