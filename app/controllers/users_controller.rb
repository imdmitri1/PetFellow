get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  @user = User.new
  erb :'users/new', layout: :authentication_layout
end

post '/users' do
  @user = User.new(params[:user]) # name, username, email, password
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'users/new', layout: :authentication_layout
  end
end

get '/users/:id' do
  authenticate!
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  @user = User.find_by(id: params[:id])
  if author?(params[:id])
    erb :'users/edit'
  else
    redirect "/users/#{@user.id}"
  end
end

put '/users/:id' do
  @user = User.find_by(id: params[:id])
  if author?(@user.id)
    @user.update_attributes(params[:user])
    if @user.save
      redirect "/users/#{@user.id}"
    else
      status 422
      @errors = @user.errors.full_messages
      erb :'users/edit'
    end
  end
end

delete '/users/:id' do
  user = User.find_by(id: params[:id])
  if author?(user.id)
    posts = Post.where(author_id: user.id)
    favorite_posts = FavoritePost.where(user_id: user.id)
    user_comments = Comment.where(author_id: user.id)
    # comments_on_user_posts = Comment.where()
    user_likes = Like.where(author_id: user.id)
    # likes_on_user_posts = Like.where()
    # likes_on_user_comments = Like.where()
    follows = Follow.where(user_id: user.id)
    # followings = Follows.where()
    # followers = Follows.where()
    # messages??
    user.destroy
    [posts,favorite_posts,user_comments,user_likes,follows].each { |item| item.map(&:destroy) if item }
    redirect '/'
  else
    redirect "/users/#{@user.id}"
  end
end
