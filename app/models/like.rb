class Like < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :likable, polymorphic: true

  validates_presence_of :likable_id, :likable_type, :author_id

  def self.total_count
    self.all.map(&:count).reduce(:+)
  end
end
