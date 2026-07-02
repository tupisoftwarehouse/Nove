#!/bin/sh

echo "Set up application package name:"

echo ""

echo "Configuring Android application package name..."

echo ""

dart run change_app_package_name:main org.tupi.nove --android > /dev/null 2>&1

echo "Done!"
