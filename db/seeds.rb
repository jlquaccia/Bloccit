# require 'faker'

# # Create Posts
# 50.times do
#   Post.create!(
#     title: Faker::Lorem.sentence,
#     body: Faker::Lorem.paragraph
#   )
# end

# posts = Post.all

# # Create Comments

# 100.times do
#   Comment.create!(
#     post: posts.sample,
#     body: Faker::Lorem.paragraph
#   )
# end

# puts "Seed finished"
# puts "#{Post.count} posts created"
# puts "#{Comment.count} comments created"

# Assignment 32 /////////////////////////////

# require 'faker'

# # Create Post
# 1.times do
#   Post.create!(
#     title: Faker::Hacker.abbreviation,
#     body: Faker::Hacker.say_something_smart
#   )
# end

# last_post = Post.last

# # Create Comment
# 1.times do
#   Comment.create!(
#     post: last_post,
#     body: Faker::Team.creature
#   )
# end

# puts "Seed finished"
# puts "#{Post.count} posts created"
# puts "#{Comment.count} comments created"

if Post.find_by(title: "Testing the New Test").nil?
  Post.create!(
    title: "Testing the New Test",
    body: "This is the body of the new test."
  )

  p = Post.find_by(title: "Testing the New Test")

  Comment.create!(
    post: p,
    body: "This commmmmment was broughttt toooo you by assignmentttt 32"
  )
else
  puts "This post was already added."
end

# ///////////////////////////////////////////