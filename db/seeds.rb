# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach(File.join(Rails.root, 'people.csv'), headers: true) do |row|
  p = Person.find_or_create_by name: row['Name'].downcase, email: row['Email'].downcase, gender: row['Gender']
  welcome = row['Welcome'] == 'TRUE'
  p.update_attribute(:welcome_sent, welcome) unless p.welcome_sent == welcome
end

CSV.foreach(File.join(Rails.root, 'possible_attendants.csv'), headers: true) do |row|
  p = Person.find_or_create_by name: row['Name'].to_s.downcase, email: row['Email'].downcase, gender: row['Gender']
  p.update_attribute :rol, 'attendant'
end

Person.find_or_create_by name: 'Johan Tique', email: 'johan.tique@gmail.com', gender: 'm', rol: 'assistant'
Person.find_or_create_by name: 'Johan Tique', email: 'johan.tique@analisistem.com', gender: 'm', rol: 'admin'
Person.find_or_create_by name: 'Johan Tique', email: 'johan_tique@yahoo.com.co', gender: 'm', rol: 'admin'
Person.find_or_create_by name: 'Johan Tique', email: 'johan_tique@hotmail.com', gender: 'm', rol: 'admin'
Person.find_or_create_by name: 'Felipe Muñoz', email: 'pipebermeo14@gmail.com', gender: 'm', rol: 'admin'
