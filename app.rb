require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative 'lib/user'
require_relative 'lib/messages'
require 'date'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  configure :development do
    register Sinatra::Reloader
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
      flash[:notice] = 'Please check your username or password.'
      redirect '/'
    end

  end

  post '/peeps' do
    t = Time.now
    p "called post"
    Messages.create(user_id: session[:user_id], message: params[:message])
    p "called create"
    redirect '/peeps'
  end

  get '/peeps' do
    @t = Time.now
    @user = User.find(session[:user_id]).username
    @result = Messages.all
    erb :peeps
  end

  get '/peeps/' do
    @name = ''
    @params = params
    @result = Messages.all
    erb :peeps_filter
  end

  run! if app_file == $0
end