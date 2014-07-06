json.array!(@users) do |user|
  json.extract! user, :id, :email, :phone, :address
  json.url users_url(user, format: :json)
end
