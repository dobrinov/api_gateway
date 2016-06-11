module Molecule
  @routes = []

  def self.run!
    install_routes
    SinatraApplication.run!
  end

  def self.routes
    @routes
  end

  def self.define_routes(&block)
    instance_eval(&block)
  end

  def self.install_routes
    routes.each do |route|
      SinatraApplication.send(route.http_method, route.path) do
        content_type 'application/json'

        Kernel.const_get((route.controller + '_controller').split('_').collect(&:capitalize).join)
          .new(params)
          .send(route.action)
      end
    end
  end

  class SinatraApplication < Sinatra::Base
    get '/api/routes' do
      content_type 'application/json'

      Molecule.routes.map do |route|
        {
          request: {
            method: route.http_method,
            path: route.path
          },
          response: {
          }
        }
      end.to_json
    end
  end

  private

  def self.get(path, to:)
    define_route(:get, path, to: to)
  end

  def self.post(path, to:)
    define_route(:post, path, to: to)
  end

  def self.put(path, to:)
    define_route(:put, path, to: to)
  end

  def self.patch(path, to:)
    define_route(:patch, path, to: to)
  end

  def self.delete(path, to:)
    define_route(:delete, path, to: to)
  end

  def self.define_route(http_method, path, to: nil)
    @routes << Route.new(http_method, path, to)
  end
end
