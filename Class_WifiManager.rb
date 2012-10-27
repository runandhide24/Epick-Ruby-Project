# Written By Lance Phelps
# Copywrite 2012
# WifiManager is intended to work with the system on getting the various components of the wifi adapter set up.


class WifiManager

	@@userEssidCon = nil

	def initializeWifi

	#The following will need some revision as it only works if your system uses wlan0 for the Wifi Adapter
	
	system("ifconfig wlan0 down") #Bring the wireless adapter down to setup the DHCP Client
	system("dhclient -r wlan0")	#Prepare the DHCP Client by setting it to listen to the wlan0 <-- lacks flexibility, plan to rewrite.
	system("ifconfig wlan0 up")	#And Bring wlan0 back up
	
	end

	def wifiScan

	#This method runs a scan of the available ESSID connections

	
end
