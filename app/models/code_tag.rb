class CodeTag < ActiveRecord::Base
  has_many :code_tag_links
  has_many :codes, through: :code_tag_links
end
