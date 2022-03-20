require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  get '/register/new' do
    erb :register
  end

  post '/register' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/login' do
    user = User.authenticate(params[:input_username], params[:input_password])

    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      # flash[:notice] = 'Please check your username or password.'
      redirect '/'
    end

  end

  get '/peeps' do
    @user = User.find(session[:user_id]).username
    erb :peeps
  end

  run! if app_file == $0
end