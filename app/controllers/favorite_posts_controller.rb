get '/favorite' do
  @favorites = FavoritePost.where(user_id: current_user.id)
  erb :'favorite_posts/index'
end
