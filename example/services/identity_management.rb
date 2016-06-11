require 'sinatra'
require 'json'

# Database stub
DB = {
  users: [
    {
      id: 1,
      email: 'deyan.dobrinov@gmail.com',
      password_digest: 'q',
      first_name: 'Deyan',
      last_name: 'Dobrinov'
    }
  ],

  sessions: [
    {
      id: 1,
      user_id: 1,
      token: 'p3NPNNY8oz7Jn-lylbMVXQ§'
    }
  ]
}

get '/sessions/:id' do
  if params[:id] == DB[:sessions][0][:token]
    status 200
  else
    status 401
  end
end

post '/sessions' do
  if params[:email] == DB[:users][0][:email] && params[:password] == DB[:users][0][:password_digest]
    { token: DB[:sessions][0][:token] }.to_json
  else
    status 401
  end
end

delete '/sessions/:id' do
  if params[:token] == DB[:sessions][0][:token]
    status 200
  else
    status 403
  end
end

post '/users' do
  status 201
  { id: DB[:users][0][:id] }.to_json
end

get '/users/:id' do
  status 200
  user = DB[:users].select { |user| user[:id] == params[:id].to_i }.first
  user.to_json
end

put '/users/:id' do
  status 200
end

delete '/users/:id' do
  status 200
end
