get '/products' do
  time = Time.now.to_i
  session  = future { ::Services::Authentication.session }; nil;
  products = future { ::Services::Products.products(session) }; nil;

  {
    session:  session,
    products: products,
    time:     time
  }.to_json
end
