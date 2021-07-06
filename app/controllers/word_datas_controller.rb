class WordDatasController < ApplicationController
  
  
  def show

    word = params[:id]
    response = HTTP.headers("app_id" => Rails.application.credentials.app_id, "app_key" => Rails.application.credentials.app_key).get("https://od-api.oxforddictionaries.com/api/v2/entries/en-gb/#{word}?strictMatch=false")
    
    render json: response.parse(:json)["results"][0] 
      
  end  
end
