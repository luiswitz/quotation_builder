# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Products
Product.create(name: 'Teach Course', price: 100.00, kind: 'subscription')
Product.create(name: 'Programming Course', price: 200.00, kind: 'subscription')
Product.create(name: 'Cooking Course', price: 130.00, kind: 'subscription')
Product.create(name: 'Pilot Course', price: 110.00, kind: 'subscription')

Product.create(name: 'Extra teaching session', price: 10.00, kind: 'service')
Product.create(name: 'Extra programming session', price: 20.00, kind: 'service')
Product.create(name: 'Extra cooking session', price: 13.00, kind: 'service')
Product.create(name: 'Extra pilot session', price: 11.00, kind: 'service')

Product.create(name: 'Book', price: 50.00, kind: 'goods')
Product.create(name: 'Laptop', price: 1500.00, kind: 'goods')
Product.create(name: 'Smartphone', price: 500.00, kind: 'goods')
Product.create(name: 'Desk', price: 300.00, kind: 'goods')
