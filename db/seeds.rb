# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#rails db:seed
#Delete all records from the children and records tables
Child.all.each do |child|
  child.records.destroy_all
end
Child.destroy_all
#Delete all records from the users table
Wishlist.delete_all
Micropost.delete_all
# User.delete_all
