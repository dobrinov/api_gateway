require 'sinatra'
require 'future'
require 'json'

require_relative 'microservices/authentication_service'
require_relative 'microservices/products_service'

get '/products' do
  time = Time.now.to_i
  session  = future { AuthenticationService.session }; nil;
  products = future { ProductsService.products(session) }; nil;

  {
    session:    session,
    products:   products,
    time: time
  }.to_json
end
