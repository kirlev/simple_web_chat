require_relative 'app/models/message'
require 'sinatra'

USER_COUNT = 0

get '/' do
    puts Message.users_count
    @users_count = (USER_COUNT += 1)
    @messages = Message.all
    erb :index 
end

get '/messages' do
    @messages = Message.all
    puts @messages.count
    erb :message_log
end

post '/messages' do
    Message.create(content: params[:content], user_id: params[:user_id])
end
