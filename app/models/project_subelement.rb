class ProjectSubelement < ActiveRecord::Base
  belongs_to :project_element, through: :project_element_id
  include Project::Status
end
