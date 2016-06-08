require_relative 'base_controller'

class MessageThreadsController < BaseController
  def index
    "#{__method__} called of #{self.class} with parameters #{params}"
  end

  def show
    "#{__method__} called of #{self.class} with parameters #{params}"
  end

  def create
    "#{__method__} called of #{self.class} with parameters #{params}"
  end

  def destroy
    "#{__method__} called of #{self.class} with parameters #{params}"
  end
end
