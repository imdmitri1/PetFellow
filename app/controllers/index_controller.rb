require 'will_paginate/array'

get '/' do
  p params
  if params.empty?
    all_posts = Post.all.order('created_at': :desc)
  elsif params.keys.include?("feed")
    authenticate!
    all_posts = []
    User.find_by(id: session[:user_id]).followings.map {|fol| fol.posts.map { |post| all_posts << post} }
    all_posts.sort_by!(&:created_at)
  else
    likes_array = Post.all.map(&:likes).map(&:count)
    average_like_amount = likes_array.reduce(:+) / likes_array.size
    all_posts = Post.all.select { |post| post.like_count > average_like_amount }
    # all_posts = Post.popular
  end
  @posts = all_posts.paginate(:page => params[:page], :per_page => 32)

  erb :index
end

# where to put this???
# get '/*' do
#   redirect '/'
# end
