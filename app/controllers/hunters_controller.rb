class HuntersController < ApplicationController

get 'hunters/:id' do
  if logged_in?
    redirect '/snake_sacks'
  end
  
  @hunter = Hunter.find_by(params[:id])
  if !@hunter.nil? && @hunter = current_hunter 
    erb :'hunters/show'
  end
  
end


end