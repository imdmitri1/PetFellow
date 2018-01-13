get '/users/:id/followers' do
  @user = User.find_by(params[:id])
  erb :'users/followers'
end

get '/users/:id/followings' do
  @user = User.find_by(params[:id])
  erb :'users/followings'
end

post '/users/:id/follow' do
  authenticate!
  Follow.find_or_create_by(user_id: params[:id], follower_id: current_user.id)
  Follow.find_or_create_by(user_id: current_user.id, following_id: params[:id])
  redirect back
end

delete '/users/:id/unfollow' do
  authenticate!
  his_list = Follow.find_by(user_id: params[:id], follower_id: current_user.id)
  your_list = Follow.find_by(user_id: current_user.id, following_id: params[:id])
  his_list.destroy
  your_list.destroy
  redirect back
end
