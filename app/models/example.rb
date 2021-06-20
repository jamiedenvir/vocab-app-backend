class Example < ApplicationRecord
  belongs_to :user
  belongs_to :prompt 

  response.headers["app_id"] = "07e4e85c",["app_key"] = "2434c7ca68bd567abc4fee242c3c9381"
  
  def word


    
    
    response = HTTP.get("https://od-api.oxforddictionaries.com/api/v2/entries/en-gb/absolve?strictMatch=false")
    
    
    response.parse(:json)

    


  end
end
