require 'sinatra/base'
require 'future'
require 'json'

# Services
require_relative 'app/services/authentication'
require_relative 'app/services/messaging'
require_relative 'app/services/notification'

# Controllers
require_relative 'app/controllers/sessions_controller'
require_relative 'app/controllers/message_threads_controller'
require_relative 'app/controllers/messages_controller'
require_relative 'app/controllers/notifications_controller'

# Framework
require_relative 'framework/molecule'
require_relative 'framework/route'

# Routes
require_relative 'config/routes'

Molecule.run!
