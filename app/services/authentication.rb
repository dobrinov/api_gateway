require_relative 'base'

module Services
  class Authentication < Base
    ENDPOINT = 'http://localhost:1234/'
  
    def verify_token(token)
      get("session/#{token}", {})
    end

    def login(username, password)
      post('session', { username: username, password: password })
    end

    def logout(token)
      delete('session', { token: token })
    end
  end
end
