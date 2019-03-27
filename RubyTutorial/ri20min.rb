#!/usr/bin/env ruby

class MegaGreeter
	attr_accessor :names
	
	def initialize(names="World")
		@names = names
	end
	
	def say_hi
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("each")
			@names.each do |name|
				puts "Hello #{name}!"
			end
		else
			puts "Hello #{names}!"
		end
		puts "\n"
	end
	
	def say_bye
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("join")
			puts "Goodbye #{@names.join(", ")}.\nCome back soon!"
		else
			puts "Goodbye #{@names}.\nCome back soon!"
		end
		puts "\n"
	end
	
end


if __FILE__ == $0
	mg = MegaGreeter.new
	mg.say_hi
	mg.say_bye
	
	mg.names = "Zeke"
	mg.say_hi
	mg.say_bye
	
	mg.names = [
		"Albert", 
		"Brenda", 
		"Charles", 
		"Dave", 
		"Englbert"
	]
	mg.say_hi
	mg.say_bye
	
	mg.names = nil
	mg.say_hi
	mg.say_bye
	
end
