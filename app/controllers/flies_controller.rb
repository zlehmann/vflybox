class FliesController < ApplicationController

  get '/flies' do
    @flies = Fly.all
    erb :'flies/index'
  end

end
