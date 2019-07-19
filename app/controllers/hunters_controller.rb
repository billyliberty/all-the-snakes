class HuntersController < ApplicationController
  
  # Permits new user to sign up for the site. This renders the signup form.
  
  get '/signup' do 
    if logged_in?
      redirect to "/hunters/#{current_hunter.id}"
    else
      erb :'/hunters/signup'
    end
  end
  
  get'/snake_bag' do 
    if current_hunter
      @snake_bag = current_hunter.snakes 
      erb :'/hunters/snake_bag'
    else
      redirect to "/"
    end
  end
  
  # Permits new user to sign up for the site. This submits the form to the database.
  
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
  
  # This permits an existing user to login. This renders the form to login.
  
  get '/login' do 
    if logged_in?
      puts session
      redirect to "/hunters/#{current_hunter.id}"
    else
      erb :'hunters/login'
    end
  end
  
  # This permits an existing user to login. This submits the login information and verifies its authenticity.
  
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
	
	# This shows the profile for the hunter.
  
  get '/hunters/:id' do
    @hunter = Hunter.find_by(id: params[:id])
    erb :'/hunters/show'
  end
  
  # This clears the session and logs the user out. 
  
  get '/logout' do 
    logged_in?
    session.clear 
    redirect to "/"
  end
  
end