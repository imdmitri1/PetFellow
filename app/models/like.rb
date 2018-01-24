class Like < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :likable, polymorphic: true

  validates_presence_of :likable_id, :likable_type, :author_id

  def self.total_count
    total = self.all.map(&:count).reduce(:+).to_i
    return "1 like" if total == 1
    return "#{total} likes" if total > 1
  end
end
