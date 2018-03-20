class MedicalRecordTemplate
  include Mongoid::Document
  embeds_many :question
   
  accepts_nested_attributes_for :question  ,:reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  belongs_to :hospital
  before_create :numbered_question
  before_update :numbered_question
  
 
  
  field :name, type: String
  field :code, type: String
  
  def numbered_question
     i=1
    
        for question in self.question 
            question.qid = i
            i = i+1
            j=1
            for answer in question.multiple_choice_question_answer
                answer.aid = j
                j = j+1
            end
        end
      
    
  end
end
