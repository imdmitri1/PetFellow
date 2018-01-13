class User < ActiveRecord::Base
  has_many :posts, foreign_key: :author_id
  has_many :favorite_posts
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :messages, foreign_key: :author_id
  has_many :followers
  has_many :subscribers, through: :followers, source: :user
  has_many :followings

  validates_presence_of :name, :username, :email, :hashed_password
  validates_uniqueness_of :email, :username

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
  #   @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end

  #  validate :password_length
  #  def password_length
  #    errors.add(:password, "must be at least six characters") unless @raw_password.length >= 6
  #  end
end
