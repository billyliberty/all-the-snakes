require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "pythonsareeverywhere"
  end

  get "/" do
    erb :index
  end
  
  helpers do 
    
    def not_signed_in 
      if !logged_in? 
        redirect "Please sign in or sign up."
      end
    end
    
    def logged_in? 
      !!session[hunter_id]
    end
    
    def current_hunter 
      Hunter.find (sessions[:hunter_id])
    end
    
end
