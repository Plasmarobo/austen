class CodeTagLink < ActiveRecord::Base
  belongs_to :code
  belongs_to :code_tag
end
