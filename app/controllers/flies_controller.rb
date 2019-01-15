class FliesController < ApplicationController

  get '/flies' do
    redirect_if_not_logged_in
    @flies = Fly.all
    erb :'flies/index'
  end

  get '/flies/new' do
    redirect_if_not_logged_in
    @user = current_user
    erb :'/flies/new'
  end

  post '/flies' do
    redirect_if_not_logged_in
    @user = current_user
    @fly = Fly.create(:name => params[:fly_name], :creator_id => @user.id)
    params[:flybox].each do |flybox_id|
      Flybox.find(flybox_id).flies << @fly
    end
    redirect to "/flies/#{@fly.id}"
  end

  get '/flies/:id' do
    redirect_if_not_logged_in
    @user = current_user
    @fly = Fly.find(params[:id])
    erb :'/flies/show'
  end

  patch '/flies/:id/edit' do
    redirect_if_not_logged_in
    @user = current_user
    @fly = Fly.find(params[:id])
    @error = change_validation(@user.id, @fly.creator_id)
    if @error == "no error"
      @fly.name = params[:fly_name]
      @fly.flyboxes.clear
      @fly.flyboxes = Flybox.find(params[:flybox])
      @fly.save
      redirect to "/flies/#{@fly.id}"
    else
      erb :'/error'
    end
  end

  delete '/flies/:id' do
    redirect_if_not_logged_in
    @user = current_user
    @fly = Fly.find(params[:id])
    @error = change_validation(@user.id, @fly.creator_id)
    if @error == "no error"
      @fly.destroy
      redirect to "/flies"
    else
      erb :'/error'
    end
  end
end
