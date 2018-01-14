class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :follower, class_name: :User
  belongs_to :following, class_name: :User

  validates_presence_of :user_id

end
