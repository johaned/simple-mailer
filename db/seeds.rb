# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach(File.join(Rails.root, 'people.csv'), headers: true) do |row|
  Person.create name: row['Name'].downcase, email: row['Email'].downcase, gender: row['Gender']
end

Person.create name: 'Johan Tique', email: 'johan.tique@analisistem.com', gender: 'm', rol: 'admin'
