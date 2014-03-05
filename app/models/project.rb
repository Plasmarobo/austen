class Project < ActiveRecord::Base
  has_many :project_elements
  include Status
end
