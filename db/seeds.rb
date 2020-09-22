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
puts 'Destroy doses'
Dose.destroy_all

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
  puts "create #{cocktail.name} #{cocktail.id}"
  5.times do
    dose = Dose.new(
      description: Faker::Lorem.sentence,
      cocktail_id: cocktail.id,
      ingredient_id: Ingredient.all.sample
    )
    dose.save
    puts "create dose #{dose.description} #{dose.cocktail_id} #{dose.ingredient_id}"
  end
end

# files = [
#   "https://images.unsplash.com/photo-1536935338788-846bb9981813?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
#   "https://images.unsplash.com/photo-1546171753-97d7676e4602?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
#   "https://images.unsplash.com/photo-1556855810-ac404aa91e85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
#   "https://images.unsplash.com/photo-1570869933251-5f3f7f14f623?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
#   "https://images.unsplash.com/photo-1598679253583-75a8b3d1912b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
#   "https://images.unsplash.com/photo-1588495505348-8c8e736ed2d1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1594141112171-b29fbbe440f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1582536866176-a6b3ed952108?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1541288892379-c987c60cd049?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1559842623-b82d2e1228a5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1594386580230-10634a9c345c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1599749210777-08450aae3ee7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1591634586875-a1e4b9725c94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1547595628-c61a29f496f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1555940726-1c297abcc1f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDAxNX0&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1598990034692-a57ccb6d03b8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1594387915746-940810f4c558?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60",
#   "https://images.unsplash.com/photo-1578664182930-39d6469c49bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=60"
#   ]