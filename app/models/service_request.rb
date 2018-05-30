class ServiceRequest
  include Mongoid::Document
  include Mongoid::Enum
  belongs_to :service_pack
  belongs_to :hospital
  enum :status, [:pending,:approved,:declined]
  field :created_at, type: DateTime
  field :replied_at, type: DateTime
  enum :sp_type, [:premium,:free]
  field :time, type: Integer
end
