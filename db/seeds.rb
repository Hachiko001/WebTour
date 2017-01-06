# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Guide.delete_all
Guide.create! id:1, name: "Duy", password: "123", date: "", language: "English", address: "HCM", email: "duy123@gmail.com",price: 0.49, active: true
Guide.create! id:2, name: "Tu", password: "123456", date: "", language: "French", address: "HCM", email: "tu123@gmail.com",price: 0.19, active: true
Guide.create! id:3, name: "Quoc", password: "123456789", date: "", language: "Japanese", address: "HCM", email: "quoc123@gmail.com",price: 0.69, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Cancelled"
