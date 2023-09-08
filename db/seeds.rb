# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.create!([
  {title: "Test1", body: "WOW Cool\r\n", user_id: nil, views: nil, clicks: nil, last_reviewed_at: nil},
  {title: "Test2", body: "Wow Cool2", user_id: nil, views: nil, clicks: nil, last_reviewed_at: nil},
  {title: "Test3", body: "Wowwowowowo", user_id: nil, views: nil, clicks: nil, last_reviewed_at: nil},
  {title: "Test4", body: "WOWOWOW", user_id: nil, views: nil, clicks: nil, last_reviewed_at: nil},
  {title: "Test5", body: "cool wow", user_id: nil, views: nil, clicks: nil, last_reviewed_at: nil}
])