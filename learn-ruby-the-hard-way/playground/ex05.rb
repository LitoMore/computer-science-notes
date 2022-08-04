name = 'Zed A. Shaw'
age = 35 # not a lie in 2009
height = 74 # inches
weight = 180 # lbs
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'
all = 'a' + 'l' + 'l'

puts "Let's talk about #{name}."
puts "He's #{height} inches tall."
puts "He's #{weight} pounds heavy."
puts "Actually that's not too heavy."
puts "He's got #{eyes} eyes and #{hair} hair."
puts "His teeth are usually #{teeth} depending on the coffee."

# this line is tricky, try to get it exactly right
puts "If I add #{age}, #{height}, and #{weight} I get #{age + height + weight}."
puts "If I use `+` to add #{eyes}, #{teeth}, and #{hair} I get #{eyes + teeth + hair}."
puts "If I add #{eyes}, #{age} I get `no implicit conversion of Integer into String` error."
puts all
puts all + all
puts "#{all + all}"
