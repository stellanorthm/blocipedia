require 'random_data'

# Create Users
5.times do
  User.create!(
  email:    Faker::Internet.email,
  password: Faker::Lorem.characters(7)
  )
end

users = User.all

 # Create Wikis
 50.times do
   Wiki.create!(
     title:  Faker::Lorem.sentence(2),
     body:   Faker::Lorem.paragraph
   )
 end

 wikis = Wiki.all

 # Create an admin user
 admin = User.create!(
   email:    'admin@gmailexample.com',
   password: 'helloworld',
   role:     'admin'
 )

 # Create a standard
 standard = User.create!(
   email:    'standard@gmailexample.com',
   password: 'helloworld'
 )

 # Create a premium
 premium = User.create!(
   email:    'premium@gmailexample.com',
   password: 'helloworld'
   role:     'premium'
 )


 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"
