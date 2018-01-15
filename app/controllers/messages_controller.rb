get '/messages' do
  @conversations = Message.where(author_id: currtent_user.id) # ?????
  erb :'messages/index'
end

get '/messages/new' do
  erb :'messages/new'
end

post '/messages' do
  authenticate!
  @message = Message.new(content: params[:content], author_id: currtent_user.id, receiver_id: params[:id])
  if @message.save
    redirect "/messages/#{params[:id]}"
  else
    @errors = @message.errors.full_messages
    redirect back
  end
end

get '/messages/:id' do
  authenticate!
  @messages = Message.where(receiver_id: [params[:id],currtent_user.id], author_id: [currtent_user.id, params[:id]]) #order('created_at')
  # @messages = Message.where("receiver_id = ? AND author_id = ?",params[:id], currtent_user.id)
  # @messages << Message.where("receiver_id = ? AND author_id = ?", currtent_user.id,params[:id])
  erb :'messages/show'
end
