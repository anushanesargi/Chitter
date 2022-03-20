require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/register' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/login' do
    user = User.authenticate(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id]).username
    erb :peeps
  end

  run! if app_file == $0
end