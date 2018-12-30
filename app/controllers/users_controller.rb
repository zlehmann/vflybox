class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'/users/new'
    else
      redirect to "/users/:#{session[:user_id]}"
    end
  end

end
