# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
	{
		email: "jc_rip@hotmail.com",
		password: "scio1234", 
		role: "admin"
	},
	{
		email: "other@hotmail.com",
		password: "scio1234"
	}
])