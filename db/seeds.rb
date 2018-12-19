# Ingredient.create(name: "lemon")

p "destroying previous ingredients"

Ingredient.delete_all

p "creating new ingredients"

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

# puts "#{drinks['strIngredient1']}"

sorted_ingredients = ingredients['drinks'].sort{|a,b| a['strIngredient1']<=>b['strIngredient1']}

sorted_ingredients.each do |item|
  Ingredient.create(name: item['strIngredient1'])
end

p "ingredients complete"

p "create cocktails"

p "creating Scarlet Witch"


scar_cocktail = Cocktail.create(
  name: "Scarlet Witch",
  photo: "https://res.cloudinary.com/deux1dbrg/image/upload/v1542351467/scar_photo.png",
  photo2: "https://res.cloudinary.com/deux1dbrg/image/upload/v1544524708/rijrdwoboked4ywukhmy.png")

p "Scarlet Witch completed"
