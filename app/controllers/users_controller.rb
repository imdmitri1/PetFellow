require 'faker'

get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user]) # username, email, password
  rand_avatar2 = "https://api.adorable.io/avatars/" + rand(1..1000).to_s
  @user.avatar = [Faker::Avatar.image, rand_avatar2].sample
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'users/new'
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
  if author?(user.id) || admin?
    posts = Post.where(author_id: user.id)
    # delete comments on user posts
    posts.map { |post| post.comments.map(&:destroy) }
    # delete likes on user posts
    posts.map { |post| post.likes.map(&:destroy) }
    # delete favors on user posts
    posts.map { |post| post.favorite_posts.map(&:destroy) }

    user_comments = Comment.where(author_id: user.id)
    # delete likes on user comments
    user_comments.map { |comment| comment.likes.map(&:destroy) }

    # getting all follow records
    follows = Follow.where(user_id: user.id)
    follows2 = Follow.where(follower_id: user.id)
    follows3 = Follow.where(following_id: user.id)

    # getting all messages
    messages = Message.where(author_id: params[:id])
    messages2 = Message.where(receiver_id: params[:id])

    user_likes = Like.where(author_id: user.id)
    favorite_posts = FavoritePost.where(user_id: user.id)

    # delete everything else
    [posts,favorite_posts,user_comments,user_likes,messages,messages2,follows,follows2,follows3].map { |item| item.map(&:destroy) if item }
    user.destroy

    redirect '/'
  else
    redirect "/users/#{@user.id}"
  end
end
