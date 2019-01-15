class FlyboxesController < ApplicationController


  get '/flyboxes' do
    redirect_if_not_logged_in
    @user = current_user
    @flyboxes = @user.flyboxes
    erb :'flyboxes/index'
  end

  get '/flyboxes/new' do
    redirect_if_not_logged_in
    erb :'/flyboxes/new'
  end

  post '/flyboxes' do
    redirect_if_not_logged_in
    @user = current_user
    @flybox = Flybox.create(:name => params[:flybox_name], :user_id => @user.id)
    redirect to "/flyboxes/#{@flybox.id}"
  end

  get '/flyboxes/:id' do
    redirect_if_not_logged_in
    @flybox = Flybox.find(params[:id])
    erb :'/flyboxes/show'
  end

  patch '/flyboxes/:id/edit' do
    redirect_if_not_logged_in
    @user = current_user
    @flybox = Flybox.find(params[:id])
    @error = change_validation(@user.id, @flybox.user_id)
    if @error == "no error"
      @flybox.name = params[:flybox_name]
      @flybox.save
      redirect to "/flyboxes/#{@flybox.id}"
    else
      erb :'/error'
    end
  end

  delete '/flyboxes/:id' do
    redirect_if_not_logged_in
    @user = current_user
    @flybox = Flybox.find(params[:id])
    @error = change_validation(@user.id, @flybox.user_id)
    if @error == "no error"
      @flybox.destroy
      redirect to "/flyboxes"
    else
      erb :'/error'
    end
  end
end
