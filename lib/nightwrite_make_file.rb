require '../lib/night_write_translate.rb'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

nightwrite = NightWrite.new(incoming_text)
translated_text = nightwrite.translate_to_braille

writer = File.open(ARGV[1], "w")
writer.write(translated_text)
writer.close

puts "Created '#{ARGV[1]}' containing #{translated_text.delete("\n").length} characters."
