User.delete_all
Post.delete_all
FavouritePost.delete_all
Comment.delete_all
# Like.delete_all
Message.delete_all
Follower.delete_all
Following.delete_all

User.create!(name: "Tom", username: "tomtom", email: "tom@mail.com", password: "password")

30.times do
  namee = Faker::Internet.user_name
  User.create!(name: namee, email: Faker::Internet.safe_email(namee), password: "password")
end
# , user_photo: Faker::Avatar.image
