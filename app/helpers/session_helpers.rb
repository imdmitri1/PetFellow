helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate!
    redirect '/sessions/new' unless logged_in?
  end

  def author?(author_id)
    author_id.to_i == session[:user_id]
  end

  def your_page?
    current_user.id == @user.id
  end

  def following?
    current_user.followings.include?(User.find_by(id: @user.id))
  end

  def liked?(post)
    post = post.likes.where(author_id: session[:user_id])
    if post[0] && post[0].count == 1
      return true
    else
      false
    end
  end

  def favorited?(post)
    post.favorite_posts.pluck(:user_id).include?(session[:user_id])
  end

  def admin?
    user = User.find_by(id: current_user.id)
    return nil if user.admin.nil?
    user.admin == ENV['ADMIN']
  end

end
