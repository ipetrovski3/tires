# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('lib/seeds/Book.csv', headers: true, encoding: 'ISO-8859-1', col_sep: ';') do |row|
  c = Client.new
  c.name = row['name']
  c.plate = row['plate']
  c.dimension = row['dimension']
  c.brand = row['brand']
  c.qty = row['qty']
  c.location = row['location']
  c.save
  puts "#{c.name}, #{c.plate} saved"
end

puts "There are now #{Client.count} rows in the transactions table"
