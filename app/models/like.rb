class Like < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :likable, polymorphic: true

  validates_presence_of :likable_id, :author_id
  
end
