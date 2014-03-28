# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'category.rb'

Category.delete_all
category_list = ["Mexican", "American", "Japanese", "Chinese", "Italian", "Irish", "Soul Food", "Coffee", "Wine Bar", "Diner"]
category_list.each do |name|
Category.create!( name: name )

end