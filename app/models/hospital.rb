class Hospital
  include Mongoid::Document
  # include Mongoid::Tenancy
  # store_in database: ->{ Thread.current[:database] }
  # tenant_key :url
  
  field :code, type: String
  field :name, type: String
  field :address, type: String
  field :phone, type: String
  field :fax, type: String
  field :website, type: String
  field :email, type: String
  
  has_one :user,  dependent: :destroy
 
  has_many :medical_record_template, dependent: :destroy
  has_many :medical_record, dependent: :destroy
  # has_tenant :medical_record_template
end
