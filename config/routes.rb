Application.routes.define do
  # Authentication
  get  '/session', to: 'sessions#show'
  post '/session', to: 'sessions#create'

  # Products
  get '/products',  to: 'products#index'
end
