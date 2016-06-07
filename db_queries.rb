require "pry"
require "./db/setup"
require "./lib/all"

def order_ascending_by(klass:, field:)
  klass.order(field)
end



puts "How many items are there? " + Item.count.to_s


o = order_ascending_by klass: Item, field: :price
puts "What is the most expensive item? " + o.last.description

binding.pry
# Who lives at 7153 Predovic Falls?
# How many Mediocre Copper Bottles did we sell?
# What is our total revenue (item cost * quantity sold for all purchases)?
# How much did Carmelo Towne spend?
# How many users have > 1 address?
