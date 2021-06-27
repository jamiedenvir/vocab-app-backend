class ExampleSerializer < ActiveModel::Serializer
  attributes :id, :word, :sentence, :prompt, :word_data 


  belongs_to :prompt 
end
