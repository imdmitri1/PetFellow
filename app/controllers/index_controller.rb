require 'will_paginate/array'

get '/' do
  p params
  if params.empty?
    all_posts = Post.all.order('created_at': :desc)
  elsif params.keys.include?("myfeed")
    authenticate!
    all_posts = []
    User.find_by(id: session[:user_id]).followings.map {|fol| fol.posts.map { |post| all_posts << post} }
    all_posts.sort_by!(&:created_at)
  else
    # likes_array = Post.all.map(&:likes).map(&:count)
    # average_like_amount = likes_array.reduce(:+) / likes_array.size
    # all_posts = Post.all.select { |post| post.like_count > average_like_amount }
    post_array = []
    Post.all.map { |post| post_array << post }
    sorted_posts = post_array.sort_by! { |post| post.like_count }
    if sorted_posts.length > 50
      all_posts = sorted_posts.last(50).reverse
    else
      all_posts = sorted_posts[-sorted_posts.length..-1].reverse
    end
    # all_posts = Post.popular
  end
  @posts = all_posts.paginate(:page => params[:page], :per_page => 32)

  erb :index
end
