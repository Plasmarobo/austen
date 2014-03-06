class ProjectSubelement < ActiveRecord::Base
  belongs_to :project_element
  include Project::Status
end
