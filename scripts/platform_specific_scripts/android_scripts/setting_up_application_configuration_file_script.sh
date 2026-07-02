#!/bin/sh

echo "Set up application configuration file:"

echo ""

echo "Configuring application configuration file..."

echo ""

sed -i 's/getByName("debug")/getByName("release")/' ./android/app/build.gradle.kts
sed -i '/compileOptions {/i\
    signingConfigs {\
        create("release") {\
            storeFile = file(keystoreProperties["storeFile"] as String)\
            storePassword = keystoreProperties["storePassword"] as String\
            keyAlias = keystoreProperties["keyAlias"] as String\
            keyPassword = keystoreProperties["keyPassword"] as String\
        }\
    }\
' ./android/app/build.gradle.kts
sed -i '1i\
import java.util.Properties\
import java.io.FileInputStream\
\
val keystoreProperties = Properties()\
val keystorePropertiesFile = rootProject.file("key.properties")\
\
if (keystorePropertiesFile.exists()) {\
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))\
}\
' ./android/app/build.gradle.kts

echo "Done!"
