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
  avatar = Faker::Avatar.image("my-own-slug", "50x50", "jpg") 
  content = Faker::Food.ingredient
  
  user = User.create!(
  	  name: name,   
  	  email: email,
	    password: password,
	    password_confirmation: password,
	    uid: uid,
      avatar: avatar
	  )

  topic = Topic.new(
    content: content,
    user_id: user.id,
    picture: avatar
    )

  topic.comments.build(
    content: 'looks yummy',
    user_id: user.id)
  topic.save
 end
    
    

 

  

