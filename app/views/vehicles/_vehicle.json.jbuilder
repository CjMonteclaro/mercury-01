json.extract! vehicle, :id, :year_model, :brand_id, :model_id, :mv_file_no, :plate_no, :engine_no, :chassis_no, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
