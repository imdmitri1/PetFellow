require 'will_paginate/array'

get '/search' do
  post_search = Post.search(params[:request])
  user_search = User.search(params[:request])
  if user_search != nil
    @user_results = user_search.paginate(:page => params[:page], :per_page => 32)
  end
  if post_search != nil
    @post_results = post_search.paginate(:page => params[:page], :per_page => 32)
  end
  erb :'search/search'
end
