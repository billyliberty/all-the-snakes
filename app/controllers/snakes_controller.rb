class SnakesController < ApplicationController
  
  get '/snakes' do 
    @snakes = Snakes.all 
    erb :'snakes/index'
  end
  
  get '/snakes/new' do 
    erb :'snakes/new'
  end
  
end