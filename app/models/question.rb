class Question
  include Mongoid::Document
  include Mongoid::Enum
  embedded_in :medical_record_template
  embeds_many :multiple_choice_question_answer
  # has_many :answer
   embeds_one :sub_question
   
  accepts_nested_attributes_for :sub_question ,:reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :multiple_choice_question_answer ,:reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  field :qid, type: Integer
  field :content, type: String
  enum :qtype, [ :multiple_choice, :short_answer, :check_box ]
  enum :atype, [ :text, :number, :date]

end
