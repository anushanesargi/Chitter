require 'sinatra/base'
require 'sinatra/reloader'
# require_relative 'lib/chitter'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/users' do
    User.create(username: params[:username], password: params[:password])
    redirect '/peeps'
  end

  get '/peeps' do
    "Welcome"
  end

  run! if app_file == $0
end