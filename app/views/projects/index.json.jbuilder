json.array!(@projects) do |project|
  json.extract! project, :id, :name, :started, :finished, :desc, :image
  json.url project_url(project, format: :json)
end
