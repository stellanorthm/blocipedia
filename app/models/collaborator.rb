class Collaborator < ActiveRecord::Base
  has_many :users, through: :wikis
end
