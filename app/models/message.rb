class Message < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :likes, as: :likable

end