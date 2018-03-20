json.extract! hospital, :id, :code, :name, :address, :phone, :fax, :website, :email, :created_at, :updated_at
json.url hospital_url(hospital, format: :json)
