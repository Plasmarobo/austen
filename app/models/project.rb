class Project < ActiveRecord::Base
  has_many :projects
  belongs_to :project, through: :parent_id
  include Project::Status
end
