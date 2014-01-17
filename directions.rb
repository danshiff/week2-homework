require 'open-uri'
require 'json'

#Get origin, and format it
print "Please enter your starting location: "
start = gets
start = start.chomp
start = start.tr(" ", "+")

#Get destination, format
print "Please enter your desired destination: "
dest = gets
dest = dest.chomp
dest = dest.tr(" ", "+")

#Get info from google
json_data = open("http://maps.googleapis.com/maps/api/directions/json?origin=#{start}&destination=#{dest}&sensor=true").read()
data = JSON.parse(json_data)
#Output info
puts "Distance: #{data['routes'][0]['legs'][0]['distance']['text']}"
puts "Travel time #{data['routes'][0]['legs'][0]['duration']['text']}:"
