require_relative 'base_controller'

class UsersController < BaseController
  def show
    "#{__method__} called of #{self.class} with parameters #{params}"
  end

  def create
    "#{__method__} called of #{self.class} with parameters #{params}"
  end

  def update
    "#{__method__} called of #{self.class} with parameters #{params}"
  end

  def destroy
    "#{__method__} called of #{self.class} with parameters #{params}"
  end
end
