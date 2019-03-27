#!/usr/bin/env ruby

a = nil

# Merely uses the value from the passed in a, does not modify a
def add_one(number)
	puts "1 - number: #{number}"
  number += 1
	puts "2 - number: #{number}"
end

puts "1 - a: #{a}"
a = 1
puts "2 - a: #{a}"
add_one(a)  # => 2
puts "3 - a: #{a}"
a           # => 1
puts "4 - a: #{a}"


puts "\n\n\n"


# Uses and modifies the passed in a
def downer(string)
  string.downcase!
	# Without the Bang it does not modify
end

a = "HELLO"  # => "HELLO"
puts "5 - a: #{a}"
downer(a)    # => "hello"
puts "6 - a: #{a}"
a            # => "hello"
puts "7 - a: #{a}"


puts "\n\n\n"


