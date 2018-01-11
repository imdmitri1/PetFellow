get '/' do
  if params.empty?
    all_posts = Post.all.order('created_at': :desc)
  else
    likes_array = Post.all.map(&:likes).map(&:count)
    average_like = likes_array.reduce(:+) / likes_array.size
    all_posts = Post.all.select { |post| post.like_count > average_like }
    # all_posts = Post.popular
  end
  @posts = all_posts.paginate(:page => params[:page], :per_page => 32)

  erb :index
end

# where to put this???
# get '/*' do
#   redirect '/'
# end
# require "will_paginate"
