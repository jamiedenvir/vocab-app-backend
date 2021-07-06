class WordDatasController < ApplicationController
  
  
  def show

    word = params[:id]
    response = HTTP.headers("app_id" => Rails.application.credentials.app_id, "app_key" => Rails.application.credentials.app_key).get("https://od-api.oxforddictionaries.com/api/v2/entries/en-gb/#{word}?strictMatch=false")
    
    api_word_data_object = response.parse(:json)["results"][0] 
    render json: {
      id: api_word_data_object["id"],

      etymologies: api_word_data_object["lexicalEntries"][0]["entries"][0]["etymologies"],

      audio: api_word_data_object["lexicalEntries"][0]["entries"][0]["pronunciations"][0]["audioFile"],

      phonetic_spelling: api_word_data_object["lexicalEntries"][0]["entries"][0]["pronunciations"][0]["phoneticSpelling"],

      definition: api_word_data_object["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"],

      example_sentence: api_word_data_object["lexicalEntries"][0]["entries"][0]["senses"][0]["examples"][0]["text"],

      synonyms: [ 
        api_word_data_object["lexicalEntries"][0]["entries"][0]["senses"][0]["synonyms"][0]["text"],
        api_word_data_object["lexicalEntries"][0]["entries"][0]["senses"][0]["synonyms"][1]["text"],
        api_word_data_object["lexicalEntries"][0]["entries"][0]["senses"][0]["synonyms"][2]["text"],
        api_word_data_object["lexicalEntries"][0]["entries"][0]["senses"][0]["synonyms"][3]["text"],
        
        ],

      lexical_category: api_word_data_object["lexicalEntries"][0]["lexicalCategory"]["text"],


      
    }
      
  end  
end
