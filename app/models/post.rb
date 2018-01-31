class Post < ActiveRecord::Base
  include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute

  belongs_to :author, class_name: "User"
  has_many :favorite_posts
  has_many :likes, as: :likable
  has_many :comments

  validates_presence_of :author_id
  validates :image_data, presence: true, unless: -> (post){post.pic_link.present?}
  validates :description, length: { maximum: 512 }

  def like_count
    self.likes.count
  end

  def self.search(word)
    found = Post.all.order('created_at': :desc).select do |post|
              info = ""
              info << post.description if post.description
              info.downcase.include?(word.downcase)
            end
    return nil if word == "" || found == []
    found
  end

end
