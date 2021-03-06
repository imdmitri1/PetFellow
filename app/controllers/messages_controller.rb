get '/messages' do
  @conversations = Message.where(author_id: current_user.id).select(:receiver_id).distinct.where.not(receiver_id: current_user.id)
  erb :'messages/index'
end

post '/messages' do
  authenticate!
  if params[:receiver].to_i == current_user.id
    redirect "/messages"
  end
  @message = Message.new(content: params[:content], author_id: current_user.id, receiver_id: params[:receiver])
  if @message.save
    redirect "/messages/#{params[:receiver]}"
  else
    @errors = @message.errors.full_messages
    redirect back
  end
end

get '/messages/:id' do
  authenticate!
  @receiver = User.find_by(id: params[:id])
  # @messages = Message.where(receiver_id: [params[:id],current_user.id], author_id: [current_user.id, params[:id]]) # not safe!
  user_messages = []
  user_messages << Message.where("receiver_id = ? AND author_id = ?", params[:id], current_user.id)
  user_messages << Message.where("receiver_id = ? AND author_id = ?", current_user.id, params[:id])
  @messages = []
  user_messages.map {|user| user.map { |message| @messages << message } }
  @messages.sort_by!(&:created_at)
  erb :'messages/show'
end
