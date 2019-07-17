class HuntersController < ApplicationController

  get 'hunters/:id' do
   if logged_in?
    redirect to '/snake_sacks/show'
   end
  
  @hunter = Hunter.find_by(params[:id])
  if !@hunter.nil? && @hunter = current_hunter 
      erb :'hunters/show'
    end
  end
  
  get '/signup' do 
    if !session[:hunter_id]
      erb :'/hunters/new'
    else
      redirect to '/snakes'
    end
  end
  
  post 'signup' do
    if params[:email] == "" || params [:password] == ""
      redirect to '/signup'
    else
      @hunter = Hunter.create[:email => params[:email], :password => params[:password]]
      session[:hunter_id] = @hunter.id 
      redirect to '/snake_sacks/show'
    end
  end
  
  
  
  


end