require 'sinatra'
require 'promise'
require 'json'

require_relative 'microservices/authentication_service'
require_relative 'microservices/products_service'

get '/products' do
  session  = promise { AuthenticationService.session }
  products = promise { ProductsService.products(session) }

  {
    session:  session,
    products: products
  }.to_json
end
