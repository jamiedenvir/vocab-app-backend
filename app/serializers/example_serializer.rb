class ExampleSerializer < ActiveModel::Serializer
  attributes :id, :word, :sentence, :prompt


  belongs_to :prompt 
end
