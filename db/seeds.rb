# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

homer = User.create(
  first_name: 'Homer',
  last_name: 'Simpson',
  email: 'homer@simpsons.com',
  password: 'donut',
  password_confirmation: 'donut'
)

homer.profile_photo.attach(io: File.open('public/images/homerprofilepic.jpeg'), filename: 'homerprofilepic.jpeg', content_type: 'image/jpeg')

homer.save!

Post.create( message: 'When I forget to run bundle install', user_id: 1,)
.pictures.attach(io: File.open("public/images/gifs/doh.gif"), filename: 'doh.gif', content_type: 'image/gif')

Post.create( message: 'When I try to fix a bug', user_id: 1,)
.pictures.attach(io: File.open("public/images/gifs/coding.gif"), filename: 'coding.gif', content_type: 'image/gif')

Post.create( message: 'Me after forgetting to do TDD', user_id: 1,)
.pictures.attach(io: File.open("public/images/gifs/hiding.gif"), filename: 'hiding.gif', content_type: 'image/gif')

Post.create( message: 'Me after getting puts "Hello World" to work ', user_id: 1,)
.pictures.attach(io: File.open("public/images/gifs/flex.gif"), filename: 'flex.gif', content_type: 'image/gif')

Post.create( message: '100% test coverage baby', user_id: 1,)
.pictures.attach(io: File.open("public/images/gifs/woohoo.gif"), filename: 'woohoo.gif', content_type: 'image/gif')

Post.create( message: 'When I get that Tesco Meal Deal', user_id: 1,)
.pictures.attach(io: File.open("public/images/gifs/donuts.gif"), filename: 'donuts.gif', content_type: 'image/gif')
