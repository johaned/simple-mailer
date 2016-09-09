# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.find_or_create_by name: 'Johan Tique', email: 'johan.tique@gmail.com', gender: 'm', rol: 'assistant'
Person.find_or_create_by name: 'Johan Tique', email: 'johan_tique@yahoo.com.co', gender: 'm', rol: 'admin'
Person.find_or_create_by name: 'Johan Tique', email: 'johan_tique@hotmail.com', gender: 'm', rol: 'admin'
