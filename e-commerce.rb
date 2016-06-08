require "./db/setup"
require "./lib/all"
require 'pry'


def get_hash table
  # returns result of to_h method for each record in a table
  records = []
  table.all.each do |r|
    records.push r.to_h
  end
  return records
end

def log_in_user
  print "Please enter your name: "
  gets.chomp
end

def clear_screen
  system("clear")
end

def get_columns array
  [
    x = array.sort_by { |h| h["id"].to_s.length }.last["id"].to_s.length,
    y = array.sort_by { |h| h["description"].to_s.length }.last["description"].to_s.length,
    z = array.sort_by { |h| h["price"].to_s.length }.last["price"].to_s.length
  ]
end

def show_items items_array
  col1, col2, col3 = get_columns items_array
  newline = 3
  count = 1
  i, d, p = items_array.first.keys

  # print headers

  until count == newline + 1 do
    print i.center(col1 + 1)
    print d.center(col2 + 1)
    print p.center(col3 + 1)
    if count < newline
      print " | "
    else
      puts
    end
    count += 1
  end
  print "\n"

  # print items

  items_array.each do |h|
    print h[i].to_s.ljust(col1 + 1)
    print h[d].ljust(col2 + 1)
    print h[p].to_s.ljust(col3 + 1)
    if count % newline == 0
      puts
    else
      print " | "
    end
    count += 1
  end
  print "\n\n"
end

def menu options, prompt
  response = nil
  until options.keys.include? response
    options.each do |k,v|
      puts "\t" + k.to_s + ". " + v
    end
    print prompt
    response = gets.chomp.to_i
  end
  return options[response]
end

def main_prompt
  response = nil
  options = {
    "A" => "Add Items",
    "E" => "Exit",
    "V" => "View Invoice"
  }
  until options.keys.include? response
    options.each do |k, v|
      print "(" + k + ") " + v
    end
     print " > "
    response = gets.chomp.upcase
  end
  return options[response]
end

def add_item
  line_item = {}

  print "Enter id of item to add: "
  line_item["id"] = gets.chomp.to_i

  print "Enter the quantity: "
  line_item["quantity"] =  gets.chomp.to_i

  line_item
end

items_local = get_hash Item
orders_by_user = {}

username = log_in_user

puts "Hi #{username}. Welcome to the shopping cart."

loop do
  orders_by_user["user"] ||= []
  clear_screen
  show_items items_local
  case main_prompt
  when "Add Items"
    orders_by_user["user"].push add_item
  when "Exit"
    break
  end

end

exit
