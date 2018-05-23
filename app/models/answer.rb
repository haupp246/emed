class Answer
  include Mongoid::Document
  include Mongoid::Enum
  embedded_in :medical_record
  belongs_to :question
  
#   field :question_id, type: String
 
  field :short_answer
  field :choice
  field :check_box, type: Array

  field :sub_question_id, type: String
  field :sub_question_answer

end
