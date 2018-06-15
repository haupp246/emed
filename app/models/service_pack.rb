class ServicePack
  include Mongoid::Document
  include Mongoid::Enum
  belongs_to :hospital

  field :name, type: String
  field :startdate, type: Date
  field :duedate, type: Date

  enum :sp_type, [ :free,:premium ]
end
