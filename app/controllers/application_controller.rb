require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "pythonsareeverywhere"
    register Sinatra::Flash
  end

  get "/" do
    erb :index
  end
  
  helpers do 
    
    def current_hunter
      @current_hunter ||= Hunter.find_by(id: session[:hunter_id]) 
    end
    
    def logged_in?
      !!current_hunter 
    end
    
  end
    
end