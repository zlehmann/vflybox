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

  post '/flies/new' do
    redirect_if_not_logged_in
    @user = current_user
    @fly = Fly.create(:name => params[:fly_name])
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

  patch '/flies/edit/:id' do
    redirect_if_not_logged_in
    @user = current_user
    @fly = Fly.find(params[:id])
    @fly.name = params[:fly_name]
    @fly.flyboxes.clear
    @fly.flyboxes = Flybox.find(params[:flybox])
    @fly.save
    redirect to "/flies/#{@fly.id}"
  end

  delete '/flies/delete/:id' do
    redirect_if_not_logged_in
    @user = current_user
    @fly = Fly.find(params[:id])
    @fly.destroy
    redirect to "/flies"
  end
end