json.extract! user, :id, :username, :email, :email_opt_in, :enabled, :created_at, :updated_at
json.url user_url(user, format: :json)
