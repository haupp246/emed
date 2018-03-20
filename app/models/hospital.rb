class Hospital
  include Mongoid::Document
  field :code, type: String
  field :name, type: String
  field :address, type: String
  field :phone, type: String
  field :fax, type: String
  field :website, type: String
  field :email, type: String
  
  has_one :user,  dependent: :destroy
 
  has_many :medical_record_template, dependent: :destroy
end
