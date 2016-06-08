require "./db/setup"
require "./lib/all"
require 'pry'

def log_in_user
  print "Please enter your name: "
  gets.chomp
end


def menu options
  response = nil
  until options.keys.include? response
    options.each do |k,v|
      puts "\t" + k.to_s + ". " + v
    end
    print "Please select an option: "
    response = gets.chomp.to_i
  end
  return options[response]
end

username = log_in_user
puts "Hi #{username}. Welcome to the shopping cart."

loop do

  case menu(
    1 => "View Available Items",
    2 => "Add Item to Cart",
    3 => "View/Edit Cart",
    4 => "Checkout",
    5 => "Exit"
  )

  when "View Available Items"
    binding.pry
  when "Add Item to Cart"
  when "View/Edit Cart"
  when "Checkout"
  when "Exit"
    break
  end

end

exit
