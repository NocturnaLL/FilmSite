# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(email: "admin@admin.com", password: 123456)
u2 = User.create(email: "user@user.com", password: 1234567)

categorieA = Category.create(title: 'Adventure', desc:'Adventure movies')
categorieB = Category.create(title: 'History', desc:'History movies')
categorieC = Category.create(title: 'Romance', desc:'Romance movies')
