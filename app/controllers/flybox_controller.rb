class FlyboxesController < ApplicationController

  get '/flyboxes' do
    @user = current_user
    @flyboxes = @user.flyboxes
    erb :'flyboxes/index'
  end

  get '/flyboxes/new' do
    erb :'/flyboxes/new'
  end

  post '/flyboxes/new' do
    @user = current_user
    @flybox = Flybox.create(:name => params[:flybox_name], :user_id => @user.id)
    redirect to "/flyboxes/#{@flybox.id}"
  end

  get '/flyboxes/:id' do
    @flybox = Flybox.find(params[:id])
    erb :'/flyboxes/show'
  end

  patch '/flyboxes/edit/:id' do
    @user = current_user
    @flybox = Flybox.find(params[:id])
    @flybox.name = params[:flybox_name]
    @flybox.save
    redirect to "/flyboxes/#{@flybox.id}"
  end
end
