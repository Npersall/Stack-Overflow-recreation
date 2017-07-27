class Vote < ActiveRecord::Base
  # Remember to create a migration!
  validates :votable_id, :votable_type, :voter_id {presence: true}
end
