require 'date'

puts "Hello !👋 I'm Moody, your personal interactive diary.\n
How are you today ?🙂"
print "➡️ "
mood = gets.chomp
puts "\nAny notes on the day you'd like to add ?👀"
print "➡️ "
notes = gets.chomp
puts "\n📅 Entry saved for #{Date.today}\n"

puts "----------------------------------------------"
puts "What would you like to do next?"
puts "1. Add another entry for today"
puts "2. View mood history"
puts "3. View mood statistics"
puts "4. Exit"
