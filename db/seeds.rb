require 'random_data'

 # Create Wikis
 50.times do
   Wiki.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end

 # Create an admin user
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@gmailexample.com',
   password: 'helloworld',
   role:     'admin'
 )

 # Create a standard
 standard = User.create!(
   name:     'Standard User',
   email:    'standard@gmailexample.com',
   password: 'helloworld'
 )

 # Create a premium
 premium = User.create!(
   name:     'Premium User',
   email:    'premium@gmailexample.com',
   password: 'helloworld'
 )

 wikis = Wiki.all


 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
