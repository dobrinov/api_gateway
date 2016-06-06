require_relative 'base'

module Services
  class Authentication < Base
    ENDPOINT = 'http://localhost:1234/'
  
    def self.session
      new.session
    end
  
    def session
      get('session', {})
    end
  end
end
