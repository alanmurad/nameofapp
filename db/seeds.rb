# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(name: "Racing Bike", description: "Fast, agile bike for everyday use.", image_url: "racebike.png")
Product.create(name: "Vintage Bike", description: "Bespoke vintage  bike in old fashioned, retro style", image_url: "vintagebike.png")
Product.create(name: "Premium Bike", description: "Bespoke bike with modern, sturdy design", image_url: "premiumbike.png")