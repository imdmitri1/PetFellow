helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate!
    redirect '/session/new' unless logged_in?
  end

  def author?(entry)
    entry.autor_id == session[:user_id]
  end

#need to check this method!
  # def authorized?
  #   session[:user_id] == params[:id].to_i
  # end
end
