class SubQuestion
  include Mongoid::Document
  include Mongoid::Enum
  embedded_in :question
  field :qid, type: Integer
  field :content, type: String
  enum :qtype, [ :multiple_choice, :short_answer, :check_box ]
  enum :atype, [ :text, :number, :date]
end
