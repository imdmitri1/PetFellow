get '/posts/new' do
  authenticate!
  @post = Post.new
  erb :'posts/new'
end

post '/posts' do
  authenticate!
  @post = Post.new(pic_link: params[:pic_link], description: params[:description], author_id: current_user.id)
  if @post.save
    redirect "/users/#{current_user.id}"
  else
    status 422
    @errors = @posts.errors.full_messages
    erb :'posts/new'
  end
end

get '/posts/:id' do
  authenticate!
  @post = Post.find_by(id: params[:id])
  erb :'posts/show'
end

get '/posts/:id/edit' do
  authenticate!
  @post = Post.find_by(id: params[:id])
  if author?(@post.author_id)
    erb :'posts/edit'
  else
    redirect "/posts/#{params[:id]}"
  end
end

put '/posts/:id' do
  authenticate!
  @post = Post.find_by(id: params[:id])
  if author?(@post.author_id)
    @post.update_attributes(pic_link: params[:pic_link], description: params[:description])
    if @post.save
      redirect "/users/#{current_user.id}"
    else
      status 422
      @errors = @posts.errors.full_messages
      erb :'posts/edit'
    end
  else
    @errors = ["It's not your post!"]
    redirect "/posts/#{params[:id]}"
  end
end

delete '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  if author?(@post.author_id)
    @post.destroy
    # delete comments & likes???
    redirect "/users/#{current_user.id}"
  else
    @errors = ["It's not your post!"]
    redirect "/posts/#{params[:id]}"
  end
end
