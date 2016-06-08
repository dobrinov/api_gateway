require 'sinatra'
require 'future'
require 'json'
require 'singleton'

# Services
require_relative 'app/services/authentication'
require_relative 'app/services/messaging'
require_relative 'app/services/notification'

# Controllers
require_relative 'app/controllers/sessions'
require_relative 'app/controllers/message_threads'
require_relative 'app/controllers/messages'
require_relative 'app/controllers/notifications'

module Application
  @routes = []

  def self.routes
    @routes
  end

  def self.define_routes(&block)
    instance_eval(&block)
  end

  def self.install_routes
    puts 'Installing routes ...'
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

Application.define_routes do
  get    '/sessions/:id',                                 to: 'sessions#show'
  post   '/sessions',                                     to: 'sessions#create'
  delete '/sessions/:id',                                 to: 'sessions#destroy'

  get    '/message_threads',                              to: 'message_threads#index'
  get    '/message_threads/:id',                          to: 'message_threads#show'
  post   '/message_threads',                              to: 'message_threads#create'
  delete '/message_threads/:id',                          to: 'message_threads#destroy'

  get    '/message_threads/:message_thread_id/messages',  to: 'messages#index'
  get    '/messages/:id',                                 to: 'messages#show'
  post   '/messages',                                     to: 'messages#create'
  delete '/messages/:id',                                 to: 'messages#destroy'
end

Application.install_routes
