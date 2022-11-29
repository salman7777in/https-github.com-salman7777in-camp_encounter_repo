# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: 'salman123456', country: 'PK', email: 'salman123456@gmail.com', password: 'Inspiron600#', admin: 'true', super_admin: 'true', terms: 'true'  )
# User.find_or_create_by(email: 'salman1234@gmail.com', encrypted_password: 'Inspiron600#', admin: 'true', super_admin: 'true')
# User.find_or_create_by(email: 'salman12345@gmail.com', encrypted_password: 'Inspiron600#', admin: 'true')

puts "Created #{User.count} USER"