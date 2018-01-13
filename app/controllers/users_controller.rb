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
  @user = User.find(params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  if author?(params[:id])
    @user = User.find(params[:id])
    erb :'users/edit'
  end
end

put '/users/:id' do
  @user = User.find(params[:id])
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

# delete account?
