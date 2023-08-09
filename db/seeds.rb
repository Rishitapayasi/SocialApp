# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |i|
  User.create(
    email: "user#{i+1}@gmail.com",
    password: "userpassword"
  )
end

5.times do |i|
  UserProfile.create(
    full_name: "user_name#{i+1}",
    bio: "I am user#{i+1}",
    birth_date: "#{Date.today}",
    user_id: i+1
  )
end

5.times do |i|
  Post.create(
    content: "this is my first post by user#{i+1}",
    image: "image by user#{i+1}",
    user_id: i+1
  )
end

5.times do |i|
  Comment.create(
    comment: "comment by user#{i+1}",
    post_id: i+1
  )
end