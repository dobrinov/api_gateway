require_relative 'base_controller'

class SessionsController < BaseController
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
