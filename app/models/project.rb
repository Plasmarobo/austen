class Project < ActiveRecord::Base
  has_many :projects
  belongs_to :project, foreign_key: :parent_id
  include Project::Status
end
