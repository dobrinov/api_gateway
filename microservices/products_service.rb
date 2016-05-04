require_relative 'base'

class ProductsService < Base
  ENDPOINT = 'http://localhost:2345/'

  def self.products(session)
    new.products(session)
  end

  def products(session)
    get('products', {})
  end
end
