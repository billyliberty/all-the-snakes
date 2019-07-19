class SnakesController < ApplicationController
  
  # If user is logged in, index of snakes can be viewed. This renders the index page.
  
  get '/snakes' do 
    if logged_in?
      @snakes = Snake.all 
      erb :'snakes/index'
    else
      redirect to "/hunters/#{@hunter.id}"
    end
  end
  
  # If user is logged in, new snake entry can be created. This renders the creation page. 
  
  get '/snakes/new' do 
    if logged_in?
      erb :'snakes/new'
    else
      redirect to "/"
    end
  end
  
  # If user is logged in, new snake entry can be created. This creates the entry in the database.
  
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
  
  # If user is logged in, user can edit their addition to the database. Users can only edit their own additions. This renders the edit page.
  
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
  
  # If user is logged in, user can edit their own addition to the database. This updates the database with the edit.
  
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
  
  # This is a show route for the addition.
  
  get "/snakes/:id" do
    if logged_in?
      find_snake
      erb :'/snakes/show'
    else
      redirect to "/"
    end
  end
  
  # This permits the deletion of an addition from the database. Users can only delete their own additions.

  
  delete '/snakes/:id' do
    find_snake
    @snake = Snake.find(params[:id])
    if @snake.hunter == current_hunter
      @snake.destroy
      flash[:message] = "Deletion Successful"
      redirect to "/"
    else
      redirect '/'
    end
  end
  
  private
  
  # This is a helper method for only this controller that locates an addition by its ID and saves it as an instance variable. 
  
    def find_snake
      @snake = Snake.find_by(id: params[:id])
    end
  
end