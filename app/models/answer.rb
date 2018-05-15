class Answer
  include Mongoid::Document
  include Mongoid::Enum
  embedded_in :medical_record
  belongs_to :question
  
#   field :question_id, type: String
  enum :qtype, [ :multiple_choice, :short_answer, :check_box ]
  field :short_answer
  field :choice
  field :check_box, type: Array
  field :question_content, type: String
  field :sub_question_id, type: String
  field :sub_question_answer

end
