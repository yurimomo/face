# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  name  = Faker::Friends.character
  email = Faker::Internet.email
  password = Faker::Internet.password
  uid   = SecureRandom.uuid
  avatar = Faker::Avatar.image
  
  user = User.create!(
  	  name: name,   
  	  email: email,
	    password: password,
	    password_confirmation: password,
	    uid: uid
	  )

  topic = Topic.new(
    content: 'topic',
    user_id: user.id
    )

  topic.comments.build(
    content: 'comment',
    user_id: user.id)
  topic.save
 end
    
    

 

  

