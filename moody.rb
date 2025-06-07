require 'json'
require 'date'

DATA_FILE = 'data.json'

def load_entries
  File.exist?(DATA_FILE) ? JSON.parse(File.read(DATA_FILE)) : []
end

def save_entries(entries)
  File.write(DATA_FILE, JSON.pretty_generate(entries))
end

def prompt(message)
  puts message
  print "➡️ "
  gets.chomp
end

def add_entry
  mood = prompt("\nHello !👋 I'm Moody, your personal interactive diary.\nHow are you today ?🙂")
  note = prompt("\nAny notes on the day you'd like to add ?👀")

  entry = {
    date: Date.today.to_s,
    mood: mood,
    note: note
  }

  entries = load_entries
  entries << entry
  save_entries(entries)

  puts "\n📅 Entry saved for #{entry[:date]}\n"
end

def view_history
  entries = load_entries
  if entries.empty?
    puts "\n📭 No entries found."
  else
    puts "\n📖 Mood History:"
    entries.each do |entry|
      puts "#{entry['date']} - Mood: #{entry['mood']} - Note: #{entry['note']}"
    end
  end
end

def view_statistics
  entries = load_entries
  return puts "\n📊 No data to analyze." if entries.empty?

  stats = entries.group_by { |e| e['mood'] }.transform_values(&:count)

  puts "\n📊 Mood Statistics:"
  stats.each do |mood, count|
    puts "#{mood}: #{count} #{'entry'.pluralize(count)}"
  end
end

class String
  def pluralize(count)
    count == 1 ? self : "#{self}s"
  end
end

def main_menu
  loop do
    puts "\n----------------------------------------------"
    puts "What would you like to do next?"
    puts "1. Add a new entry"
    puts "2. View mood history"
    puts "3. View mood statistics"
    puts "4. Exit"

    choice = prompt("Choose an option")

    case choice
    when "1" then add_entry
    when "2" then view_history
    when "3" then view_statistics
    when "4" then break
    else
      puts "❌ Invalid choice. Please try again."
    end
  end

  puts "\n👋 Goodbye! Take care!"
end

add_entry
main_menu
