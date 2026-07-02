#!/bin/sh

echo "Add application internet permission:"

echo ""

echo "Adding internet permission in Android..."

echo ""

sed -i '/<manifest /a\
<uses-permission android:name="android.permission.INTERNET" />' ./android/app/src/main/AndroidManifest.xml

echo "Done!"
