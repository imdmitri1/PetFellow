get '/messages' do
  erb :'messages/index'
end

get '/messages/new' do
  erb :'messages/new'
end

post '/messages' do
  authenticate!
  @message = Message.new(content: params[:content], author_id: currtent_user.id, receiver_id: params[:id])
  if @message.save
    redirect back
  else
    @errors = @message.errors.full_messages
    redirect back
  end
end
