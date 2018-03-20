class MultipleChoiceQuestionAnswer
  include Mongoid::Document
  embedded_in :multiple_choice_question 
  
  field :aid, type: Integer
  field :content, type: String
  
  
end
