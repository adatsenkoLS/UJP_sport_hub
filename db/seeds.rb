# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = User.create!({ first_name: 'Admin', last_name: 'Administrator', email: 'admin@admin.com',
  password: 'adminpassword', role: 1 })

category_names = %w[NBA NFL NHL CBB CFB NASCAR GOLF SOCCER]
category_names.each do |name|
Category.create!(name: name.to_s)
end

subcategory_names = ['AFC West', 'AFC East', 'AFC North', 'AFC South']
subcategory_names.each do |name|
Subcategory.create!(name: name.to_s, category_id: Category.first.id)
end

conferences_names = ['AFC West, AFC East, AFC North, AFC South']
conferences_names.each do |name|
Conference.create!(name: name.to_s)
end




coutry =  Country.create!(coutry_name: 'Texas')

city_names = ['Houston', 'Dallas', 'Austin', 'Plano','Laredo']
city_names.each do |name|

  City.create!(city_name: name.to_s,country_id: coutry.id)
end
