require "pry"
require "./db/setup"
require "./lib/all"

def order_ascending_by(klass:, field:)
  klass.order(field)
end

## 1

puts "How many items are there? " + Item.count.to_s

## 2

o = order_ascending_by klass: Item, field: :price
puts "What is the most expensive item? " + o.last.description

## 3

u = Address.where(street: "7153 Predovic Falls").first.user
puts "Who lives at 7153 Predovic Falls? " +
     u.first_name + " " + u.last_name

## 4

i = Item.where(description: "Mediocre Copper Bottle").first
puts "How many Mediocre Copper Bottles did we sell? " + i.purchases.count.to_s

## 5

p = Purchase.all

revenue = p.reduce 0 do |accum, o|
  accum += o.item.price * o.quantity
end

## 6

puts "What is our total revenue (item cost * quantity sold for all purchases)? " + "$" + revenue.round(2).to_s

## 7

u = User.find_by(first_name: "Carmelo", last_name: "Towne")
u_purchases = Purchase.where(user_id: u.id)
u_total = u_purchases.reduce 0 do |accum, p|
  accum += p.quantity * p.item.price
end

puts "How much did Carmelo Towne spend? " + "$" + u_total.to_s

## 8

u = User.all
total = 0
u.each do |a|
  if a.addresses.count > 1
    total += 1
  end
end

puts "How many users have > 1 address? " + total.to_s
