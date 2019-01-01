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

  post '/flyboxes/new' do
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

  patch '/flyboxes/edit/:id' do
    redirect_if_not_logged_in
    @user = current_user
    @flybox = Flybox.find(params[:id])
    @flybox.name = params[:flybox_name]
    @flybox.save
    redirect to "/flyboxes/#{@flybox.id}"
  end

  delete '/flyboxes/delete/:id' do
    redirect_if_not_logged_in
    @user = current_user
    @flybox = Flybox.find(params[:id])
    @flybox.destroy
    redirect to "/flyboxes"
  end
end
