require 'open-uri'
require 'json'

print "Please enter your starting location: "
start = gets
start = start.chomp
start = start.tr(" ", "+")

print "Please enter your desired destination: "
dest = gets
dest = dest.chomp
dest = dest.tr(" ", "+")

json_data = open("http://maps.googleapis.com/maps/api/directions/json?origin=#{start}&destination=#{dest}&sensor=true").read()
data = JSON.parse(json_data)
puts "Distance: #{data['routes'][0]['legs'][0]['distance']['text']}"
puts "Travel time #{data['routes'][0]['legs'][0]['duration']['text']}:"
