# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
COMMENT = ["fantastic", "very good", "great", "not so good", "pretty bad"]
maxi = User.first
gordon = User.find(2)
restaurants= Restaurant.all

# puts 'Creating 100 fake restaurants...'
# 100.times do
#   restaurant = Restaurant.new(
#     name:    Faker::Company.name,
#     address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#     user:  maxi
#   )
#   restaurant.save!
# end
# puts 'Finished!'

# puts 'Creating 100 fake comments..'
#   restaurants.each do |restaurant|
#     comment = Comment.new(
#       content: "#{Faker::Quote.robin} it was #{COMMENT.sample}",
#       restaurant: restaurant,
#       user: gordon
#     )
#     comment.save!
#   end
# puts 'Finished!'