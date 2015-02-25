json.array!(@projects) do |project|
  json.extract! project, :id, :name, :started, :finished, :body, :icon
  json.url project_url(project, format: :json)
end
