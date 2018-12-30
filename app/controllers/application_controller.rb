require './config/environment'
require 'sinatra/base'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    enable :sessions
    set :views, 'app/views'
    set :public_folder, 'public'
    set :session_secret, "virtualflyboxsecrete11221"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

    def current_user
      User.find(session[:user_id])
    end
  end

  #launch point
  get '/' do
    erb :index
  end
end
