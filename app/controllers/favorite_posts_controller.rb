get '/favorite' do
  @favorites = FavoritePost.where(user_id: current_user.id)
  erb :'favorite_posts/index'
end

post '/favorite' do
  authenticate!
  favorite = FavoritePost.find_by(post_id: params[:post_id])
  if favorite == nil
    FavoritePost.create(post_id: params[:post_id], user_id: current_user.id)
    redirect back
  else
    favorite.destroy
    redirect back
  end
end
