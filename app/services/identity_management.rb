require_relative 'base'

module Services
  class IdentityManagement < Base
    base_uri 'localhost:1234'

    def self.users
      User.new
    end

    def self.sessions
      Session.new
    end
  end

  class User < IdentityManagement
    base_uri "#{base_uri}/users"

    def find(id)
      JSON.parse(self.class.get("/#{id}")).to_json
    end

    def create(first_name, last_name, email, password, password_confirmation)
      self.class.post('')
    end

    def update(first_name, last_name, email, password, password_confirmation)
      self.class.put('')
    end

    def destroy(id)
      self.class.delete("/#{id}")
    end
  end

  class Session < IdentityManagement
    base_uri "#{base_uri}/sessions"

    def verify(token)
      self.class.get("/#{token}")
    end

    def create(email, password)
      self.class.post('', { body: { email: email,  password: password }})
    end

    def destroy(token)
      self.class.delete("/#{token}")
    end
  end
end
