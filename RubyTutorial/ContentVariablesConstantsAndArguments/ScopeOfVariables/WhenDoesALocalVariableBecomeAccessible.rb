#!/usr/bin/env ruby


# Method a that defines a = 99
# Parsed and used, not called
def a
  puts "Method `a' called"
  99
end

[1, 2].each do |i|
  if i == 2
    puts "a = #{a}"
  else
    a = 1
    puts "a = #{a}"
  end
end
