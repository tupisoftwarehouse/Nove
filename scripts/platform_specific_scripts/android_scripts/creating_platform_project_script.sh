#!/bin/sh

echo "Create platform project:"

echo ""

echo "Creating platform project..."

echo ""

flutter create --platforms=android . > /dev/null 2>&1
rm -rf ./test/widget_test.dart

echo "Done!"
