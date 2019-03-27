#!/usr/bin/env ruby

# a & b are top level variables
# i is only in the .upto loop

a = 0
b = 0

1.upto(3) do |i|
	c = i
	puts "Start: a: #{a} / b: #{b} / c: #{c} / i: #{i}" 
  a += i
  b = i*i
	puts "Finish: a: #{a} / b: #{b} / c: #{c} / i: #{i}"
	puts "\n"
end
# a => 6
# b is not defined here

puts "Finish: a: #{a} / b: #{b}"
# c & i cannot be referenced here as it is only in the .upto loop

