# User.delete_all
# Post.delete_all
# FavoritePost.delete_all
# Comment.delete_all
# Like.delete_all
# Message.delete_all
# Follow.delete_all

User.create!(name: "Tom", username: "tomtom", bio: Faker::HitchhikersGuideToTheGalaxy.quote, avatar: Faker::Avatar.image, email: "tom@mail.com", password: "password", admin: ENV['ADMIN'])

10.times do |n|
  namee = Faker::Internet.user_name
  User.create!(username: namee.chars.shuffle.join, email: Faker::Internet.safe_email(namee), bio: Faker::HitchhikersGuideToTheGalaxy.quote, avatar: [Faker::Avatar.image,"https://api.adorable.io/avatars/" + (n+100).to_s].sample, password: "password")
end

100.times do |n|
  Post.create!(description: Faker::Hipster.sentence, pic_link: "https://unsplash.it/500?image=" + (n+5).to_s, author_id: rand(1..11))
  # sleep(1)
end

20.times do
  FavoritePost.create!(post_id: rand(1..100), user_id: rand(1..11))
end

100.times do
  Comment.create!(content: Faker::Hacker.say_something_smart, post_id: rand(1..100), author_id: rand(1..11))
end

100.times do
  Like.create!(count: 1, likable_type: "Post", likable_id: rand(1..100), author_id: rand(1..10))
end

100.times do
  Like.create!(count: 1, likable_type: "Comment", likable_id: rand(1..100), author_id: rand(1..10))
end


100.times do
  Message.create!(content: ["Hey, ", "Hi, ", "Hello, "].sample + Faker::Hacker.say_something_smart, author_id: rand(1..10), receiver_id: rand(1..10))
end

10.times do
  rand1 = rand(1..10)
  rand2 = rand(1..10)
  Follow.create!(user_id: rand1, follower_id: rand2)
  Follow.create!(user_id: rand2, following_id: rand1)
end
