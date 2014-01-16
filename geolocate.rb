require 'open-uri'
require 'json'

print "Please enter an address, city, or zipcode (or well known location): "
address = gets
address = address.chomp
address = address.tr(" ", "+")

json_data = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=true").read()
data = JSON.parse(json_data)
puts "Latitude: #{data['results'][0]['geometry']['location']['lat']}"
puts "Longitude: #{data['results'][0]['geometry']['location']['lng']}"