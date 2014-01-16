#Get lat and lon from google

require 'open-uri'
require 'json'

#Get input, format it correctly
print "Please enter an address, city, or zipcode (or well known location): "
address = gets
address = address.chomp
address = address.tr(" ", "+")

#Get coord's from google.
loc_json_data = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=true").read()
loc_data = JSON.parse(loc_json_data)
lat = loc_data['results'][0]['geometry']['location']['lat']
lng = loc_data['results'][0]['geometry']['location']['lng']

#Plug coord's into openmap
json_data = open("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lng}&units=imperial").read()
data = JSON.parse(json_data)
puts "It's #{data['main']['temp']}f outside there."
