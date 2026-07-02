#!/bin/sh

echo "Create platform project:"

echo ""

echo "Creating platform project..."

echo ""

flutter create --platforms=ios .
rm -rf ./test/widget_test.dart

echo "Done!"
