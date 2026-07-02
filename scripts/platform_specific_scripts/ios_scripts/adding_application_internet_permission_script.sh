#!/bin/sh

echo "Add application internet permission:"

echo ""

echo "Adding internet permission in iOS..."

echo ""

sed -i 's|</dict>|    <key>com.apple.security.network.client</key>\n    <true/>\n</dict>|' "ios/Runner/Info.plist"

echo "Done!"
