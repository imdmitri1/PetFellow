get '/search' do
  post_search = Post.search(params[:request])
  user_search = User.search(params[:request])
  @post_results = post_search.paginate(:page => params[:page], :per_page => 32)
  @user_results = user_search.paginate(:page => params[:page], :per_page => 32)
  erb :'search/search'
end
