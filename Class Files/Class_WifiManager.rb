# Written By Lance Phelps
# Copywrite 2012
# WifiManager is intended to work with the system on getting the various components of the wifi adapter set up.
# Though I haven't yet uploaded the license I intend this project to be licensed under a GPL3

class WifiManager
	
	
	def initialize
	
		@availibleWifiCells = nil
		@essidPassword = nil
		
		
	end
	
	def getAvailibleWifiCells
		
		if @availibleWifiCells != nil
			return @availibleWifiCells
		else
			puts "Error 1: undefined varible"
		end 
			 
	end
	
	def getEssidPassword
		
		if @essidPassword != nil
			return @essidPassword
		else
			puts "Error 1: undefined veriable"
		end
	end
	
	def initializeWifi (adapterInterface)

		system("ifconfig #{ adapterInterface } down") #Bring the wireless adapter down to setup the DHCP Client
		system("dhclient -r #{ adapterInterface }")	#Prepare the DHCP Client by setting it to listen to the wlan0 <-- lacks flexibility, plan to rewrite.
		system("ifconfig #{ adapterInterface } up")	#And Bring wlan0 back up
	
	end

	def wifiScan (adapterInterface)

		#This method runs a scan of the available ESSID connections then stores them in the instance veriable availibleWifiCells

		@availibleWifiCells = system("iwlist #{ adapterInterface } scanning")
	
	end
	
	def requestPassword
		
		print "The Essid You are attempting to connect to is encrypted. \n Please enter the Password:"
		@essidPassword = gets
	
	end
end
