ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    erb :homepage
  end
  post '/users' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       user_name: params[:user_name],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/main'
    else
      redirect '/'
    end
  end

  get '/login' do
    erb :login
  end

  post '/user' do
    redirect '/main'
  end

  get '/main' do
    erb :main

  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
