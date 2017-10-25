class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :favorite_posts
  has_many :likes, as: :likable 
end
