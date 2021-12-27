#!/bin/bash

SystemConfigurationDIR="/Library/Preferences/SystemConfiguration"

AirportPreferences="$SystemConfigurationDIR/com.apple.airport.preferences.plist"
NetworkIdentifiactions="$SystemConfigurationDIR/com.apple.network.identification.plist"
MessageTracer="$SystemConfigurationDIR/com.apple.wifi.message-tracer.plist"
NetworkInterfaces="$SystemConfigurationDIR/NetworkInterfaces.plist"
Preferences="$SystemConfigurationDIR/preferences.plist"

#check if user is root
if [ "$(id -u)" != "0" ]; then
    echo "⛔️This script must be run as root!"
    exit 1
fi


echo "🛠Fixing network configuration..."
rm $AirportPreferences
echo "AirportPreferences removed"
rm $NetworkIdentifiactions
echo "NetworkIdentifiactions removed"
rm $MessageTracer
echo "MessageTracer removed"
rm $NetworkInterfaces
echo "NetworkInterfaces removed"
rm $Preferences
echo "Preferences removed"

echo "✅Network configuration fixed successfully!"
echo "✅Restarting your Mac!"
sudo shutdown -r now
