#!/bin/sh

echo "Build Android application bundle:"

echo ""

echo "Building Android application bundle..."

echo ""

flutter build appbundle --build-name=$APPLICATION_VERSION --build-number="$APPLICATION_BUILD_NUMBER" > /dev/null 2>&1

echo "Done!"
