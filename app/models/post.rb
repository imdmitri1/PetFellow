class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :favorite_posts
  has_many :likes, as: :likable

  # need to fix it
  # scope :popular, lambda {
  #   select("post.id,post.description,post.pic_link, count(likes.id) AS likes_count").
  #   joins(:likes).
  #   group("posts.id").
  #   order("likes_count DESC")
  # }

  def like_count
    self.likes.count
  end
end
