class Project < ActiveRecord::Base
  has_many :tasks
  include Project::Status
end
