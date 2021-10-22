# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



coutry =  Country.create!(coutry_name: 'Texas')

city_names = ['Houston', 'Dallas', 'Austin', 'Plano','Laredo']
city_names.each do |name|

  City.create!(city_name: name.to_s,country_id: coutry.id)
end
