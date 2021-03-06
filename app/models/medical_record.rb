class MedicalRecord
  include Mongoid::Document
  
  embeds_many :answer
  validates_presence_of :answer
  validate :all_question_answered
  
  
  
  
  accepts_nested_attributes_for :answer ,:reject_if => lambda { |a| (a[:short_answer].blank? && a[:choice].blank? && a[:check_box].blank? || [:question].blank?)  }, 
  :allow_destroy => true
  def all_question_answered
   
    errors.add(:base, "You have to fill in all question") if self.answer.size < self.medical_record_template.question.size
  end
  belongs_to :patient
  belongs_to :medical_record_template
  belongs_to :hospital
  
  field :rid, type: String
  field :created_at, type: DateTime
  field :patient_name, type: String

  def self.search(search)
    if search
     
      any_of({:patient_id => search},{:id => search},{:patient_name => /#{search}/i})
    end

  end
  
end
