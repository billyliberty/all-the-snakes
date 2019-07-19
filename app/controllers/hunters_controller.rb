class HuntersController < ApplicationController
  
  get '/signup' do 
    if logged_in?
      redirect to "/hunters/show"
    else
      erb :'/hunters/signup'
    end
  end
  
  post '/hunters' do
    if params[:name] == "" || params[:email] == "" || params[:password] == ""
      redirect to "/signup"
    else
      @hunter = Hunter.new(:name => params[:name], :email => params[:email], :password => params[:password])
      @hunter.save
      session[:hunter_id] = @hunter.id
      puts session
      redirect to "/hunters/#{@hunter.id}"
    end
  end
  
  
  get '/login' do 
    if logged_in?
      redirect to "/hunters/show"
    else
      erb :'hunters/login'
    end
  end
  
  post '/login' do
    @hunter = Hunter.find_by(email: params[:email])
    if @hunter && @hunter.authenticate(params[:password])
	    session[:hunter_id] = @hunter.id
	    puts session
	    redirect to "/hunters/#{@hunter.id}"
    else
	    redirect to "/login"
    end
	end
  
  get '/hunters/:id' do
    @hunter = Hunter.find_by(id: params[:id])
    erb :'/hunters/show'
  end
  
  get '/logout' do 
    logged_in?
    session.clear 
    redirect to "/"
  end
  
end