# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Team.create!(event_name: '6年男子', member1: '石川一郎', member2: '石川二郎', member3: '石川三郎', member4: '石川四郎', member5: '石川五郎', member6: '石川六郎', member7: '石川七郎', users_id: 5)
Team.create!(event_name: '4年女子', member1: '--石川一郎--', member2: '--石川二郎--', member3: '--石川三郎--', member4: '--石川四郎--', member5: '--石川五郎--', member6: '--石川六郎--', member7: '--石川七郎--', users_id: 5)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?