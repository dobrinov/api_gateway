require 'sinatra'
require 'json'

require_relative 'microservices/authentication_service'
require_relative 'microservices/products_service'

get '/products' do
  session  = AuthenticationService.session
  products = ProductsService.products(session)

  {
    session:  session,
    products: products
  }.to_json
end

# require 'promise'
# require 'future'

# y = future  { sleep(2) && 6 * 7 }
# x = promise { 1 + 2 }

# puts x + y
