class HuntersController < ApplicationController

  get 'hunters/:id' do
   if logged_in?
    redirect to '/snake_sacks'
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
  
  


end