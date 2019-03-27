#!/usr/bin/env ruby

# Arguments for a method with * assign Arg[0], then assign the rest to array all
def foo(prefix, *all)
  all.each do |element|
    puts "#{prefix}#{element}"
  end
end

foo("val = ", 1, 2, 3)


puts "\n\n\n"


# Variable assignment with * works quite the same way
x = nil
y = nil
x, *y = [7, 8, 9]
puts "Try #1 - x: #{x} / y: #{y}"
# x                  # => 7
# y                  # => [8, 9]

x = nil
y = nil
x,    = [7, 8, 9]
puts "Try #2 - x: #{x} / y: #{y}"
# x                  # => 7

x = nil
y = nil
x     = [7, 8, 9]
puts "Try #3 - x: #{x} / y: #{y}"
# x                  # => [7, 8, 9]

x = nil
y = nil


puts "\n\n\n"


# & Prepended

def meth1(&b)
  puts b.call(9)
end

meth1 {|i| i + i }

def meth2
  puts yield(8)
end

square = proc {|i| i * i }

meth2 {|i| i + i }
meth2 &square


i = nil























