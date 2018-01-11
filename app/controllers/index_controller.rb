get '/' do
  if params.empty?
    all_posts = Post.all.order('created_at': :desc)
  else
    all_posts = Post.all
  end
  @posts = all_posts
  erb :index
end

# where to put this???
# get '/*' do
#   redirect '/'
# end
