class SnakesController < ApplicationController
  
  get '/snakes' do 
    @snakes = Snakes.all 
    erb :'snakes/index'
  end
  
  get '/snakes/new' do 
    erb :'snakes/new'
  end
  
  get '/snakes/:id/edit' do
    @snake = Snake.find(params[:id])
    erb :'snakes/edit'
  end
  
  # post '/snakes/:id' do
  
  get "/snakes/:id" do
    @snake = Snake.find(params[:id])
    erb :'snakes/show'
  end
  
end