class SnakesController < ApplicationController
  
  get '/snakes' do 
    @snakes = Snake.all 
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
    find_snake
    if logged_in?
      if @snake.hunter == current_hunter
        erb :'/snakes/edit'
      else
        redirect to "hunters/#{current_hunter.id}"
      end
    else
      redirect to "/"
    end
  end
  
  patch '/snakes/:id' do
    find_snake
    if logged_in?
      if @snake.hunter == current_hunter
    
        @snake.update(:content => params[:content], :length => params[:length], :weight => params[:weight], :monetary_value => params[:monetary_value])
        redirect to "snakes/#{@snake.id}"
      else 
        redirect to "users/#{current_hunter.id}"
      end
    else
      redirect to "/"
    end
  end
  
  get "/snakes/:id" do
    find_snake
    erb :'/snakes/show'
  end
  
  delete '/snakes/:id' do
    find_snake
    @snake = Snake.find(params[:id])
    if @snake.hunter == current_hunter
      @snake.destroy
      redirect '/'
    else
      redirect '/'
    end
  end
  
  private
  
    def find_snake
      @snake = Snake.find(params[:id])
    end
    
  
  
end