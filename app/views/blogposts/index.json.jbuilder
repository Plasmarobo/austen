json.array!(@blogposts) do |blogpost|
  json.extract! blogpost, :id, :name, :body, :create
  json.url blogpost_url(blogpost, format: :json)
end
