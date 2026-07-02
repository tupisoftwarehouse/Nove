#!/bin/sh

echo "Set up iOS status bar content color to light:"

echo "Configuring status bar content color..."

echo ""

sed -i '/<key>UIViewControllerBasedStatusBarAppearance<\/key>/{
    n
    a\        <key>UIStatusBarStyle</key>
    a\        <string>UIStatusBarStyleLightContent</string>
}' "ios/Runner/Info.plist"

echo "Done!"
