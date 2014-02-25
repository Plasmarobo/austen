json.array!(@users) do |user|
  json.extract! user, :id, :name, :social_network, :email, :access_token
  json.url user_url(user, format: :json)
end
