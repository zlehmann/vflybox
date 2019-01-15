class UsersController < ApplicationController

  helpers do
    def validate_signup(username, password)
      error = "no errors"
      if username.empty? == true
        error = "No username entered."
      elsif password.empty? == true
        error = "No password entered."
      elsif User.find_by(username: username)
        error = "That username already exists."
      end
      error
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'/users/new'
    else
      redirect to "/users/:#{session[:user_id]}"
    end
  end

  post '/signup' do
    @error = validate_signup(params[:username], params[:password])
    if @error == "no errors"
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect to "/users/show"
    else
      erb :'/signup'
    end
  end

  get '/login' do
    if !session[:user_id]
      erb :'/users/login'
    else
      redirect to "/users/:#{session[:user_id]}"
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/show"
    else
      @error = "User password combination does not exist."
      erb :error
    end
  end

  get '/users/show' do
    redirect_if_not_logged_in
    @user = current_user
    erb :'/users/show'
  end

  get '/logout' do
    redirect_if_not_logged_in
    session.clear
    redirect to "/"
  end
end
