json.extract! user, :id, :firstName, :lastName, :maidenName, :age, :gender, :email, :phone, :username, :password, :birthDate, :image, :bloodGroup, :height, :weight, :eyeColor, :hair, :domain, :ip, :address, :macAddress, :university, :bank, :company, :ein, :ssn, :userAgent, :created_at, :updated_at
json.url user_url(user, format: :json)
