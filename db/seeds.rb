puts "🌱 Seeding spices..."
require 'active_record'
require_relative '../config/environment'

10.times do
User.create(
email: Faker::Internet.email,
password:Faker::Internet.password
)
end
10.times do
Recipe.create(
name: Faker::Food.dish,
ingredients: Faker::Food.ingredient,
cooking_time: rand(10..120),
instructions: Faker::Food.description,
user_id: rand(1..10)
)
end
