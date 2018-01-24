
get '/sessions/new' do
  erb :'sessions/new' #, layout: :authentication_layout
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    status 401
    @errors = ["Your username or password was wrong"]
    erb :'sessions/new' #, layout: :authentication_layout
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end
