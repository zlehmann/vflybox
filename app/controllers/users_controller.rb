class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'/users/new'
    else
      redirect to "/users/:#{session[:user_id]}"
    end
  end

  post '/signup' do
    @user = User.create(:username => params[:username], :password => params[:password])
    session[:user_id] = @user.id
    redirect to "/users/show"
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
    if @user && user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/:#{session[:user_id]}"
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
