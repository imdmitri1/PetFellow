class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :description, limit: 512
      t.string :pic_link
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end


# 30.times do
#   namee = Faker::Internet.user_name
#   User.create(name: namee, email: Faker::Internet.safe_email(namee), password: "password", user_photo: Faker::Avatar.image)
# end
#
# 31.times do
#   Question.create!(title: Faker::Hacker.say_something_smart, question_body: Faker::Hipster.paragraph(rand(4..15)), author_id: rand(1..31))
# end
#
# 90.times do
#   Answer.create(answer_body: Faker::Hipster.paragraph(rand(4..10)), question_id: rand(1..31), answerer_id: rand(1..31))
# end
#
# 10.times do
#   Comment.create(commentable_type: "Question", commentable_id: rand(1..31), comment_body: Faker::Hacker.say_something_smart, commenter_id: rand(1..31))
# end
#
# 100.times do
#   Comment.create(commentable_type: "Answer", commentable_id: rand(1..90), comment_body: Faker::Hacker.say_something_smart, commenter_id: rand(1..31))
# end
#
# 300.times do
#   Vote.create(votable_type: "Question", votable_id: rand(1..31), voter_id: rand(1..31), value: [1,1,1, -1].sample )
# end
#
# 300.times do
#   Vote.create(votable_type: "Answer", votable_id: rand(1..90), voter_id: rand(1..31), value: [1,1,1, -1].sample )
# end
