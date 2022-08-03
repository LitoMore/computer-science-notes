print "Give me a number: "
number = gets.chomp.to_i

bigger = number * 100
puts "A bigger number is #{bigger}."

print "Give me another number: "
another = gets.chomp
number = another.to_f

if number < 0
  smaller = number * 100
elsif number == 0
  smaller = -1
else
  smaller = number / 100
end

puts "A smaller number is #{smaller}."
