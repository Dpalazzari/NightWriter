require '../lib/night_read_translate.rb'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

nightread = NightRead.new(incoming_text)
english = nightread.remove_line_break

writer = File.open(ARGV[1], "w")
writer.write(english)
writer.close

puts "Created '#{ARGV[1]}' containing #{english.length} characters."
