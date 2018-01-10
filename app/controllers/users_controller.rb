get '/users/new' do
  @user = User.new
  erb :'users/new', layout: :authentication_layout
end

post '/users' do
  @user = User.new(params[:user]) # name, username, email, password
  if @user.save
    session[:user_id] = @user.id
    redirect '/index'
  else
    status 422
    erb :'users/new', layout: :authentication_layout
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
