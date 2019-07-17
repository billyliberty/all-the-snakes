class HuntersController < ApplicationController

  get 'hunters/:id' do
   if logged_in?
    redirect to '/hunters/show'
  end
  
  @hunter = Hunter.find_by(params[:id])
  if !@hunter.nil? && @hunter = current_hunter 
      erb :'hunters/show'
    end
  end
  
  get '/signup' do 
    erb :'/hunters/new'
  end
  
  post '/hunters' do
    binding.pry
  end
  
  get '/login' do 
    erb :'hunters/login'
  end
  

end