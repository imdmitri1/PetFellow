require 'faker'

# User.delete_all
# Post.delete_all
# FavoritePost.delete_all
# Comment.delete_all
# Like.delete_all
# Message.delete_all
# Follow.delete_all

# pet_collection = [
#           "https://images.unsplash.com/photo-1456081445129-830eb8d4bfc6?auto=format&fit=crop&w=1358&q=80",
#           "https://images.unsplash.com/photo-1467184576221-d5d206ab2707?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1458046913496-b049204810ac?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1508948956644-0017e845d797?auto=format&fit=crop&w=1132&q=80",
#           "https://images.unsplash.com/photo-1511717004695-7862a87f4b3d?auto=format&fit=crop&w=928&q=80",
#           "https://images.unsplash.com/photo-1507568237455-03228e5ddb7e?auto=format&fit=crop&w=1546&q=80",
#           "https://images.unsplash.com/photo-1470617522248-ace6e93315a5?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1504016652888-14988390a8fa?auto=format&fit=crop&w=934&q=80",
#           "https://images.unsplash.com/photo-1511876849877-f8d0d953d2e0?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1482066490729-6f26115b60dc?auto=format&fit=crop&w=1404&q=80",
#           "https://images.unsplash.com/photo-1446730853965-62433e868929?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1494256997604-768d1f608cac?auto=format&fit=crop&w=1401&q=80",
#           "https://images.unsplash.com/photo-1417028441456-f283323fe2d6?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1512027792141-80e5842b87c8?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1516399779-1480b4f76df6?auto=format&fit=crop&w=975&q=80",
#           "https://images.unsplash.com/photo-1514917073844-2f691ae526c0?auto=format&fit=crop&w=1352&q=80",
#           "https://images.unsplash.com/photo-1484244233201-29892afe6a2c?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1436902799100-7eb776a61f79?auto=format&fit=crop&w=934&q=80",
#           "https://images.unsplash.com/photo-1483470668053-3d97462011ec?auto=format&fit=crop&w=1351&q=80",
#           "https://images.unsplash.com/photo-1490636964683-08937fc7f402?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1514866955434-f091a9c8716f?auto=format&fit=crop&w=934&q=80",
#           "https://images.unsplash.com/photo-1508077520137-4c18ff1adb68?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1446231855385-1d4b0f025248?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1424709746721-b8fd0ff52499?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1505628346881-b72b27e84530?auto=format&fit=crop&w=934&q=80",
#           "https://images.unsplash.com/photo-1506499377715-687ed75d24cd?auto=format&fit=crop&w=934&q=80",
#           "https://images.unsplash.com/photo-1505044024939-c154d39ca595?auto=format&fit=crop&w=934&q=80",
#           "https://images.unsplash.com/photo-1452441271666-5d998aa2f6cc?auto=format&fit=crop&w=1351&q=80",
#           "https://images.unsplash.com/photo-1471086615137-166d50188228?auto=format&fit=crop&w=934&q=80",
#           "https://images.unsplash.com/photo-1472157592780-9e5265f17f8f?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1445066183574-725e943e6282?auto=format&fit=crop&w=958&q=80",
#           "https://images.unsplash.com/photo-1507146426996-ef05306b995a?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1503514662580-2388029e9434?auto=format&fit=crop&w=1349&q=80",
#           "https://images.unsplash.com/photo-1457473075527-b0db85c08e66?auto=format&fit=crop&w=1355&q=80",
#           "https://images.unsplash.com/photo-1470081766425-a75c92adff0b?auto=format&fit=crop&w=934&q=80",
#           "https://images.unsplash.com/photo-1504595403659-9088ce801e29?auto=format&fit=crop&w=934&q=80",
#           "https://images.unsplash.com/photo-1503756506745-833f21a1d537?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1502673530728-f79b4cab31b1?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1494913148647-353ae514b35e?auto=format&fit=crop&w=1352&q=80",
#           "https://images.unsplash.com/photo-1442291928580-fb5d0856a8f1?auto=format&fit=crop&w=1489&q=80",
#           "https://images.unsplash.com/photo-1482066490729-6f26115b60dc?auto=format&fit=crop&w=1404&q=80",
#           "https://images.unsplash.com/photo-1503256207526-0d5d80fa2f47?auto=format&fit=crop&w=933&q=80",
#           "https://images.unsplash.com/photo-1505015390928-f9e55218544f?auto=format&fit=crop&w=934&q=80",
#           "https://images.unsplash.com/photo-1498892156743-6d5da30bab8b?auto=format&fit=crop&w=1001&q=80",
#           "https://images.unsplash.com/photo-1452857297128-d9c29adba80b?auto=format&fit=crop&w=1334&q=80",
#           "https://images.unsplash.com/photo-1458410489211-ba19aa2f2902?auto=format&fit=crop&w=1369&q=80",
#           "https://images.unsplash.com/photo-1458530970867-aaa3700e966d?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1475518112798-86ae358241eb?auto=format&fit=crop&w=1350&q=80",
#           "https://images.unsplash.com/photo-1479623186097-2bb07e242ae0?auto=format&fit=crop&w=1352&q=80",
#           "https://images.unsplash.com/photo-1507320901381-ffe8b30f8e8a?auto=format&fit=crop&w=1352&q=80",
#           "https://images.unsplash.com/photo-1452563788656-37c252ce6850?auto=format&fit=crop&w=934&q=80",
#           "https://images.unsplash.com/photo-1452721226468-f95fb66ebf83?auto=format&fit=crop&w=1100&q=80",
#           "https://images.unsplash.com/photo-1447768005573-3b54cdf058a2?auto=format&fit=crop&w=582&q=80"
#         ]
#
# User.create!(name: "Tom", username: "tomtom", bio: Faker::HitchhikersGuideToTheGalaxy.quote, avatar: Faker::Avatar.image, email: "tom@mail.com", password: "password", admin: ENV['ADMIN'])
#
# 10.times do |n|
#   namee = Faker::Internet.user_name
#   User.create!(name: namee, username: namee + rand(10..100).to_s, email: Faker::Internet.safe_email(namee), bio: Faker::HitchhikersGuideToTheGalaxy.quote, avatar: [Faker::Avatar.image,"https://api.adorable.io/avatars/" + (n+100).to_s].sample, password: "password")
# end
#
#
# 52.times do |n|
#   Post.create!(description: Faker::BackToTheFuture.quote, pic_link: pet_collection[n], author_id: rand(1..11))
#   # sleep(1)
# end
#
# 20.times do
#   FavoritePost.create!(post_id: rand(1..57), user_id: rand(1..11))
# end
#
# 100.times do
#   Comment.create!(content: Faker::Hacker.say_something_smart, post_id: rand(1..57), author_id: rand(1..11))
# end
#
# 400.times do
#   Like.create!(count: 1, likable_type: "Post", likable_id: rand(1..57), author_id: rand(1..10))
# end
#
# 150.times do
#   Like.create!(count: 1, likable_type: "Comment", likable_id: rand(1..100), author_id: rand(1..10))
# end
#
#
# 50.times do
#   Message.create!(content: ["Hey, ", "Hi, ", "", ""].sample + Faker::Hacker.say_something_smart, author_id: rand(1..10), receiver_id: rand(1..10))
# end
#
# 30.times do
#   rand1 = rand(1..11)
#   rand2 = rand(1..11)
#   Follow.create!(user_id: rand1, follower_id: rand2)
#   Follow.create!(user_id: rand2, following_id: rand1)
# end

pet_coll2 = [
            "https://images.unsplash.com/photo-1447969025943-8219c41ea47a?auto=format&fit=crop&w=1350&q=80",
            "https://images.unsplash.com/photo-1448698314110-8c1b903e0717?auto=format&fit=crop&w=1013&q=80",
            "https://images.unsplash.com/photo-1421098518790-5a14be02b243?auto=format&fit=crop&w=1489&q=80",
            "https://images.unsplash.com/photo-1501538383113-ff3d1c43ed54?auto=format&fit=crop&w=1350&q=80",
            "https://images.unsplash.com/photo-1489924034176-2e678c29d4c6?auto=format&fit=crop&w=1351&q=80"
]

g = User.find_by(username: "guest")
g.delete if g

User.create!(name: "Guest", username: "guest", bio: Faker::HitchhikersGuideToTheGalaxy.quote, avatar: Faker::Avatar.image, email: "guest@mail.com", password: "123456")

user = User.find_by(email: "guest@mail.com")

5.times do |n|
  Post.create!(description: Faker::BackToTheFuture.quote, pic_link: pet_coll2[n], author_id: user.id)
end

8.times do
  FavoritePost.create!(post_id: rand(1..57), user_id: user.id)
end

10.times do
  Comment.create!(content: Faker::Hacker.say_something_smart, post_id: rand(1..57), author_id: user.id)
end

15.times do
  Like.create!(count: 1, likable_type: "Post", likable_id: rand(1..57), author_id: user.id)
end

10.times do
  Like.create!(count: 1, likable_type: "Comment", likable_id: rand(1..100), author_id: user.id)
end


4.times do
  Message.create!(content: ["Hey, ", "Hi, ", "", ""].sample + Faker::Hacker.say_something_smart, author_id: user.id, receiver_id: rand(3..10))
end

2.times do
  rand1 = rand(3..12)
  Follow.create!(user_id: rand1, follower_id: user.id)
  Follow.create!(user_id: user.id, following_id: rand1)
end

5.times do
  rand1 = rand(3..12)
  Follow.create!(user_id: user.id, follower_id: rand1)
  Follow.create!(user_id: rand1, following_id: user.id)
end
