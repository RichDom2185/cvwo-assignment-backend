# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: "Test User", email: "test@eml.co", password: "123456")
item1 = Todo.create(title: "item1", description: "content1", tag: "tag1", date: "2020-01-01", time: "00:00", user: user)
item2 = Todo.create(title: "item2", description: "content2", tag: "tag2", date: "2020-01-02", time: "00:00", user: user)
item3 = Todo.create(title: "item3", description: "content3", tag: "tag3", date: "2020-01-03", time: "00:00", user: user)