class User < ActiveRecord::Base
  has_many :posts, foreign_key: :author_id
  has_many :favorite_posts
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :messages, foreign_key: :author_id
  has_many :follows
  has_many :followings, through: :follows
  has_many :followers, through: :follows

  validates_presence_of :username, :email, :hashed_password
  validates_uniqueness_of :email, :username
  validates :bio, length: { maximum: 512 }
  validates :username, length: { maximum: 32 }
  validates :email, length: { maximum: 64 }
  #  validate :password_length


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

  #  def password_length
  #    errors.add(:password, "must be at least six characters") unless @raw_password.length >= 6
  #  end

  def self.search(word)
    word = word.downcase
    found = User.all.order('created_at': :desc).select do |user|
              # user.name.downcase.include?(word) ||
              user.username.downcase.include?(word) ||
              user.bio.include?(word)
            end
    return nil if word == "" || found == []
    found
  end

  # trying to display avatar, if user db avatar == nil
  # so we don't save it as user avatar for him
  # def avatar
  #   @avatar || "https://api.adorable.io/avatars/10"
  # end

end
