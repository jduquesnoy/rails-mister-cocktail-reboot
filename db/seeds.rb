# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'json'
require 'open-uri'

puts 'Destroy ingredients'
Ingredient.destroy_all

puts 'Destroy Cocktails'
Cocktail.destroy_all

puts 'Create ingredients'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredients = JSON.parse(ingredient_serialized)
ingredients['drinks'].each do |ingredient|
  i = Ingredient.create(name: ingredient['strIngredient1'])
  puts "create #{i.name}"
end

10.times do
  cocktail = Cocktail.new(
    name: Faker::Games::Zelda.character
  )
  cocktail.save
  puts "create #{cocktail.name}"
  # 5.times do |t|
  #   dose = Dose.new(
  #     description: Faker::Lorem.sentence,
  #     cocktail_id: cocktail.id,
  #     ingredient_id: Ingredient.find(t)
  #   )
  #   puts "create dose #{dose.description} #{dose.cocktail_id} #{dose.ingredient_id}"
  # end
end
# puts "Destroy ingredients"
# Ingredient.destroy_all if Rails.env.development?

# puts "Destroy Cocktails"
# Cocktail.destroy_all if Rails.env.development?

# puts "Create ingredients"
# url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# ingredients = JSON.parse(open(url).read)
# ingredients["drinks"].each do |ingredient|
#   i = Ingredient.create(name: ingredient["strIngredient1"])
#   puts "create #{i.name}"i
# end