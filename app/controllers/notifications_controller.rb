require_relative 'base_controller'

class NotificationsController < BaseController
  def index
    "#{__method__} called of #{self.class} with parameters #{params}"
  end

  def show
    "#{__method__} called of #{self.class} with parameters #{params}"
  end
end
