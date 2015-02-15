# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
order = Order.create({name: "Swagger"})
Customer.create({order_id: order.id, first_name: "Johny", last_name: "Doey"})
Customer.create({order_id: order.id, first_name: "Oz", last_name: "Doey"})
