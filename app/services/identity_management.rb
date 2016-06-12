require_relative 'base'

module Services
  class IdentityManagement < Base
    base_uri 'localhost:1234'

    def self.users
      User
    end

    def self.sessions
      Session
    end
  end

  class User < IdentityManagement
    base_uri "#{base_uri}/users"

    def self.find(id)
      response = get("/#{id}")
      new(JSON.parse(response.body))
    end

    def self.create(first_name, last_name, email, password, password_confirmation)
      #TODO: Pass parameters
      response = post('')

      if response.code == 201
        new(JSON.parse(response.body))
      else
        false
      end
    end

    def update(first_name, last_name, email, password, password_confirmation)
      #TODO: Pass parameters
      response = self.class.put('')

      if response.code == 200
        true
      else
        false
      end
    end

    def destroy
      response = self.class.delete("/#{id}")

      if response.code == 200
        true
      else
        false
      end
    end
  end

  class Session < IdentityManagement
    base_uri "#{base_uri}/sessions"

    def valid?
      response = self.class.get("/#{token}")

      if response.code == 200
        true
      else
        false
      end
    end

    def self.create(email, password)
      response = post('', { body: { email: email,  password: password }})

      if response.code == 201
        new(JSON.parse(response.body))
      else
        false
      end
    end

    def destroy
      response = self.class.delete("/#{token}")

      if response.code == 200
        true
      else
        false
      end
    end
  end
end
