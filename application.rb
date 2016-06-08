require 'sinatra/base'
require 'future'
require 'json'
require 'singleton'

# Services
require_relative 'app/services/authentication'
require_relative 'app/services/messaging'
require_relative 'app/services/notification'

# Controllers
require_relative 'app/controllers/sessions_controller'
require_relative 'app/controllers/message_threads_controller'
require_relative 'app/controllers/messages_controller'
require_relative 'app/controllers/notifications_controller'

class SinatraApplication < Sinatra::Base
end

module Molecule
  @routes = []

  def self.routes
    @routes
  end

  def self.define_routes(&block)
    instance_eval(&block)
  end

  def self.install_routes
    routes.each do |route|
      SinatraApplication.send(route.http_method, route.path) do
        Kernel.const_get((route.controller + '_controller').split('_').collect(&:capitalize).join)
          .new(params)
          .send(route.action)
      end
    end
  end

  private

  def self.get(path, to:)
    define_route(:get, path, to: to)
  end

  def self.post(path, to:)
    define_route(:post, path, to: to)
  end

  def self.delete(path, to:)
    define_route(:delete, path, to: to)
  end

  def self.define_route(http_method, path, to: nil)
    @routes << Route.new(http_method, path, to)
  end
end

class Route
  attr_reader :http_method, :path, :controller, :action

  def initialize(http_method, path, processor)
    @http_method = http_method
    @path = path
    @controller = controller_from(processor)
    @action = controller_action_from(processor)
  end

  private

  def controller_from(processor)
    processor.split('#')[0]
  end

  def controller_action_from(processor)
    processor.split('#')[1]
  end
end

Molecule.define_routes do
  get    '/sessions/:id',                                    to: 'sessions#show'
  post   '/sessions',                                        to: 'sessions#create'
  delete '/sessions/:id',                                    to: 'sessions#destroy'

  get    '/message_threads',                                 to: 'message_threads#index'
  get    '/message_threads/:id',                             to: 'message_threads#show'
  post   '/message_threads',                                 to: 'message_threads#create'
  delete '/message_threads/:id',                             to: 'message_threads#destroy'

  get    '/message_threads/:message_thread_id/messages',     to: 'messages#index'
  get    '/message_threads/:message_thread_id/messages/:id', to: 'messages#show'
  post   '/message_threads/:message_thread_id/messages',     to: 'messages#create'
  delete '/message_threads/:message_thread_id/messages/:id', to: 'messages#destroy'

  get    '/notifications',                                   to: 'notifications#index'
  get    '/notifications/:id',                               to: 'notifications#show'
end

Molecule.install_routes

SinatraApplication.run!
