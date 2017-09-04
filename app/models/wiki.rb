class Wiki < ActiveRecord::Base
  belongs_to :user
  default_scope { where(published: true) }
end
