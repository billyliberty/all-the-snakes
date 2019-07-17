class HuntersController < ApplicationController
  
  get '/signup' do 
    erb :'/hunters/new'
  end
  
  post '/signup' do
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      @hunter = Hunter.new(:name => params[:name], :email => params[:email], :password => params[:password])
      @hunter.save
      session[:hunter_id] = @hunter.id
      redirect to '/hunters/#{@hunter.id}'
    else
      redirect to '/signup'
    end
  end
  
  get '/login' do 
    erb :'hunters/login'
  end
  
  get '/hunters/:id' do
    @hunter = Hunter.find_by(id: params[:id])
    erb :'/hunters/show'
  end
  
  get '/logout' do 
    session.destroy 
    redirect to '/'
  end
  
end