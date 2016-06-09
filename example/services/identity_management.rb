require 'sinatra'
require 'json'

# Database stub
VALID_TOKEN = 'abcd1234'
VALID_USERNAME = 'deyan'
VALID_PASSWORD = 'qweqwe'

get '/session/:token' do
  if params[:token] == VALID_TOKEN 
    status 200
  else
    status 401
  end
end

post '/session' do
  if params[:username] == VALID_USERNAME && params[:password] == VALID_PASSWORD
    { token: VALID_TOKEN }.to_json
  else
    status 401
  end
end

delete '/session' do
  if params[:token] == VALID_TOKEN
    status 200
  else
    status 403
  end
end

post '/users' do
end

get '/users/:id' do
end

put '/users/:id' do
end

delete '/users/:id' do
end
