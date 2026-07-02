#!/bin/sh

echo "Set up android application:"

echo ""

./scripts/platform_specific_scripts/android_scripts/creating_platform_project_script.sh

echo ""

./scripts/platform_specific_scripts/android_scripts/setting_up_application_home_screen_name_script.sh

echo ""

./scripts/platform_specific_scripts/android_scripts/setting_up_application_splash_screen_script.sh

echo ""

./scripts/platform_specific_scripts/android_scripts/setting_up_home_screen_application_icon_script.sh

echo ""

./scripts/platform_specific_scripts/android_scripts/setting_up_application_package_name_script.sh

echo ""

./scripts/platform_specific_scripts/android_scripts/adding_application_internet_permission_script.sh

echo ""

./scripts/platform_specific_scripts/android_scripts/creating_application_key_file_script.sh

echo ""

./scripts/platform_specific_scripts/android_scripts/creating_application_key_property_file_script.sh

echo ""

./scripts/platform_specific_scripts/android_scripts/setting_up_application_configuration_file_script.sh
