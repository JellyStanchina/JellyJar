#!/usr/bin/env ruby

# Scope of Variables

# Top level
var = 1

puts "Point #1"

class Demo
	# Class or Module definition
	var = 2
	
	#This action happens at the point of Class Definition!
	puts "Point #2"
	
	def myMethod
		# Method definition
		var = 3		
		puts "In Method var: #{var}" 
	end
	
	#This action happens at the point of Class Definition!
	puts "In Class var: #{var}"
	
end

puts "Point #3"

puts "At Top Level var: #{var}"

Demo.new.myMethod
