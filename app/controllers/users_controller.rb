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
    redirect to "/users/show/#{@user.id}"
  end

  get '/users/show/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end
end
