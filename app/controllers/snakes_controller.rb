class SnakesController < ApplicationController
  
  get '/snakes' do 
    @snakes = Snakes.all 
    erb :'snakes/index'
  end
  
  get '/snakes/new' do 
    erb :'snakes/new'
  end
  
  post '/snakes' do
    if !logged_in?
      redirect to "/"
    end
      
    if params[:content] != "" || params[:length] != "" || params[:weight] != "" || params[:monetary_value != ""]
    
      @snake = Snake.new(:content => params[:content], :length => params[:length], :weight => params[:weight], :monetary_value => params[:monetary_value], hunter_id: current_hunter.id )
      @snake.save
      redirect to "/snakes/#{@snake.id}"
      
    else redirect to "/snakes/new"
    end
  
  end
  
  get '/snakes/:id/edit' do
    @snake = Snake.find(params[:id])
    erb :'snakes/edit'
  end
  
  
  get "/snakes/:id" do
    @snake = Snake.find(params[:id])
    erb :'snakes/show'
  end
  
end