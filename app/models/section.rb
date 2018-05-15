class Section
  
  include Mongoid::Document
  include Mongoid::Enum
  embedded_in :medical_record_template
  recursively_embeds_many
  accepts_nested_attributes_for :child_section ,:reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  field :sid, type: Integer
  field :content, type: String
end
