class MedicalRecord
  include Mongoid::Document
  
  embeds_many :answer
  validates_presence_of :answer
  validate :all_question_answered
  belongs_to :patient
  
  
  
  accepts_nested_attributes_for :answer ,:reject_if => lambda { |a| (a[:short_answer].blank? && a[:choice].blank? && a[:check_box].blank? || [:question].blank?)  }, 
  :allow_destroy => true
  def all_question_answered
   
    errors.add(:base, "You have to fill in all question") if self.answer.size < self.medical_record_template.question.size
  end
  belongs_to :patient
  belongs_to :medical_record_template
  
  
  field :rid, type: String
  field :created_at, type: DateTime
  

  def self.search(search)
    if search
      any_of({:patient_id => search},{:id => search })
    end

  end
  
end
