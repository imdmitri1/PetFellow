post '/like/:likable_type/:likable_id' do
  authenticate!
  @like = Like.find_or_create_by(likable_type: params[:likable_type], likable_id: params[:likable_id], author_id: current_user.id)
  if @like.count != 1
    @like.update_attributes(count: 1)
  else
    @like.update_attributes(count: 0)
  end
  # @like.save #???
  redirect back
end
