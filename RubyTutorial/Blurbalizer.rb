

class Blurb
  attr_accessor :content, :time, :mood

  def initialize(mood, content="")
    @time    = Time.now
    @content = content[0..39]
    @mood    = mood
  end

  def moodify
    if    @mood == :sad
      return ":-("
    elsif @mood == :happy
      return ":-)"
	else
	  return ":-|"
    # Add other moods here
    end
    
  end
end

class Blurbalizer
  def initialize(title)
    @title  = title
    @blurbs = []
  end

  def add_a_blurb(mood, content)
    @blurbs << Blurb.new(mood, content)
  end

  def show_timeline
    puts "Blurbalizer: #{@title} has #{@blurbs.count} Blurbs"

    @blurbs.sort_by { |t|
      t.time
    }.reverse.each { |t|
      puts "#{t.content.ljust(40)} #{t.moodify.ljust(5)} #{t.time}"
    }
  end
end

puts "Hello World!"
puts "\n"

myapp = Blurbalizer.new "The Biggest Blurp Ever!"
myapp.add_a_blurb :moody, "What a moody Kid"
myapp.add_a_blurb :sad, "What a sad kid"
myapp.add_a_blurb :happy, "What a happy kid"
myapp.add_a_blurb :sad, "A Sad Person"
myapp.add_a_blurb :happy, "A Happy Person"

myapp.show_timeline
puts "\n"

puts "Hello Again"
puts "\n"
