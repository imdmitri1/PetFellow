class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :post
  has_many  :likes, as: :likable

  validates_presence_of :content, :post_id, :author_id
  validates :content, length: { maximum: 512 }

end
