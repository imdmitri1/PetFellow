class Message < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :likes, as: :likable

  validates_presence_of :content, :author_id, :receiver_id
  validates :content, length: { maximum: 512 }

end
