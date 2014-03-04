class ProjectElement < ActiveRecord::Base
  belongs_to :project
  has_many :project_subelements
end
