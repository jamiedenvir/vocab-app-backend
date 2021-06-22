class Example < ApplicationRecord
  belongs_to :user
  belongs_to :prompt 

  
  def word_data

  
    response = HTTP.headers("app_id" => Rails.application.credentials.app_id, "app_key" => Rails.application.credentials.app_key).get("https://od-api.oxforddictionaries.com/api/v2/entries/en-gb/#{word}?strictMatch=false")
 
    response.parse(:json)

  end
end

