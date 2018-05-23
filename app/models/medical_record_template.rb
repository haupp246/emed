class MedicalRecordTemplate
  include Mongoid::Document
#   include Mongoid::Tenant
  
  embeds_many :question
  has_many :medical_record , dependent: :destroy
  accepts_nested_attributes_for :question  ,:reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  belongs_to :hospital
  before_save :remove_answer,:numbered_question
  

  
  
  field :name, type: String
  field :code, type: String
  field :department, type: String
  
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
  def remove_answer
    for question in self.question
        if (question.short_answer?) 
            question.multiple_choice_question_answer.destroy_all
        end
    end
  end

end
