json.extract! profile, :id, :user_id, :first_name, :middle_name, :last_name, :birthdate, :address_1, :address_2, :city_id, :province_id, :phone, :created_at, :updated_at
json.url profile_url(profile, format: :json)
