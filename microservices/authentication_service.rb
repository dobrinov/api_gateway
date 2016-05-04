require_relative 'base'

class AuthenticationService < Base
  ENDPOINT = 'http://localhost:1234/'

  def self.session
    new.session
  end

  def session
    get('session', {})
  end
end
