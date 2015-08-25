class Code < ActiveRecord::Base
  has_many :code_tag_links
  has_many :code_tags, through: :code_tag_links
end
