require_relative 'base_controller'

class UsersController < BaseController
  def show
    user = ::Services::IdentityManagement.users.find(params[:id])
    user.to_json
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
