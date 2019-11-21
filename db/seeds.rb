# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Ingredient.destroy_all
puts "Removed the ingredients from the list"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
string = open(url).read
hash = JSON.parse(string)

array = hash['drinks']
array.each do |minihash|
  ingredient = minihash['strIngredient1']
  Ingredient.create(name:ingredient)
  puts "Added the #{ingredient} ingredient"
end
