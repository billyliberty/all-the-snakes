class SnakesController < ApplicationController
  
  get '/snakes' do 
    @snakes = Snakes.all 
    erb :'snakes/index'
  end
  
  get '/snakes/new' do 
    erb :'snakes/new'
  end
  
  post '/snakes' do
    if params[:content] == "" || params[:length] == "" || params[:weight] == "" || params[:monetary_value == ""]
      redirect to "/snakes/new"
    else
      @snake = Snake.new(:content => params[:content], :length => params[:length], :weight => params[:weight], :monetary_value => params[:monetary_value])
      @snake.save
    end
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