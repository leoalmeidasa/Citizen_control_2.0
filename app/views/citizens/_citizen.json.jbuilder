json.extract! citizen, :id, :name, :cpf, :cns, :email, :birth_date, :telephone, :status, :created_at, :updated_at
json.url citizen_url(citizen, format: :json)
