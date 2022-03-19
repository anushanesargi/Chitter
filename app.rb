require 'sinatra/base'
require 'sinatra/reloader'
# require_relative 'lib/chitter'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  run! if app_file == $0
end