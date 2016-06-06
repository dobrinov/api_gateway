require 'sinatra'
require 'future'
require 'json'

# Services
require_relative 'app/services/authentication'
require_relative 'app/services/products'

# Controllers
require_relative 'app/controllers/products'
