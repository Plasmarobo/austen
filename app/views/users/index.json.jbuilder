json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :twitter, :google, :facebook
  json.url user_url(user, format: :json)
end
