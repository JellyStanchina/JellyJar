#!/usr/bin/env ruby


# Output varies as threads will occur when they occur

threads = []

["one", "two"].each do |name|
  threads << Thread.new do
    local_name = name
    a = 0
    3.times do |i|
      Thread.pass
      a += i
      puts "#{local_name}: #{a}"
    end
  end
end

threads.each {|t| t.join }