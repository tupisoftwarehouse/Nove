#!/bin/sh

echo "Run project tests:"

echo ""

echo "Running project tests..."

echo ""

flutter test --concurrency="$(nproc)"

echo "Done!"
