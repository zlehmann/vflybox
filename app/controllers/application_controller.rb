require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secrete, "virtualflyboxsecrete11221"
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
