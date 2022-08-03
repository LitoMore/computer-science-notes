print "How old are you?\n"
age = gets.chomp.to_i

print "How old are you this time?\n"
new_age = gets.chomp.to_i

print "How tall are you?\n"
height = gets.chomp

print "How much ddo you weight?\n"
weight = gets.chomp

puts "So, you're #{age + new_age} old, #{height} tall and #{weight} heavy."
