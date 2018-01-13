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
  @post = Post.find_by(id: params[:id])
  erb :'posts/show'
end

get '/posts/:id/edit' do
  authenticate!
  @post = Post.find_by(id: params[:id])
  erb :'posts/edit'
end

put '/posts/:id' do
  authenticate!
  @post = Post.find_by(id: params[:id])
  if author?(@post)
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
    redirect back
  end
end

delete '/posts/:id' do
  authenticate!
  @post = Post.find_by(id: params[:id])
  if author?(@post)
    @post.destroy
    redirect "/users/#{current_user.id}"
  else
    @errors = ["It's not your post!"]
    redirect back
  end
end

get '/posts/:id/comments/new' do
  @post = Post.find_by(id: params[:id])
  @comment = Comment.new
  erb :'comments/new'
end

post '/posts/:id/comments' do
  authenticate!
  @comment = Comment.new(content: params[:comment], post_id: params[:id], author_id: current_user.id)
  if @comment.save
    redirect "/posts/#{params[:id]}"
  else
    status 422
    @errors = @comments.errors.full_messages
    erb :'commets/new'
  end
end

get '/posts/:id/comments/:comment_id/edit' do
  @post = Post.find_by(id: params[:id])
  @comment = Comment.find_by(id: params[:comment_id])
  erb :'comments/edit'
end

put '/posts/:id/comments/:comment_id' do
  @post = Post.find_by(id: params[:id])
  @comment = Comment.find_by(id: params[:comment_id])
  @comment.update_attributes(content: params[:comment])
  if @comment.save
    redirect "/posts/#{params[:id]}"
  else
    status 422
    @errors = @comments.errors.full_messages
    erb :'commets/edit'
  end
end
