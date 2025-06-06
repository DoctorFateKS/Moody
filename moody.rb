require 'date'

puts "Hello !👋 I'm Moody, your personal interactive diary.\n
How are you today ?🙂"
print "➡️ "
mood = gets.chomp
puts "\nAny notes on the day you'd like to add ?👀"
print "➡️ "
note = gets.chomp
# Sauvegarder les entrées de l'utilisateur à la date du jour
mood_history = "#{Date.today} - Mood: #{mood} - Note: #{note}"
File.write('data.rb', mood_history)
puts "\n📅 Entry saved for #{Date.today}\n"

puts "----------------------------------------------"
puts "What would you like to do next?"
puts "1. Add another entry for today"
puts "2. View mood history"
puts "3. View mood statistics"
puts "4. Exit"
print "➡️ "

choice = gets.chomp
while choice != "4" do
  if choice == "1"
    puts "Hello !👋 I'm Moody, your personal interactive diary.\n
    How are you today ?🙂"
    print "➡️ "
    mood = gets.chomp
    puts "\nAny notes on the day you'd like to add ?👀"
    print "➡️ "
    note = gets.chomp
    # Sauvegarder les entrées de l'utilisateur à la date du jour
    mood_history = "#{Date.today} - Mood: #{mood} - Note: #{note}"
    File.write('data.rb', mood_history)
  end

  if choice == "2"
    puts File.read('data.rb')
  end

  puts "----------------------------------------------"
  puts "What would you like to do next?"
  puts "1. Add another entry for today"
  puts "2. View mood history"
  puts "3. View mood statistics"
  puts "4. Exit"
  print "➡️ "
  choice = gets.chomp
end
