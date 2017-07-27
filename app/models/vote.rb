class Vote < ActiveRecord::Base

  validates :votable_id, :votable_type, :voter_id, {presence: true}
  validates :voter_id, uniqueness: {scope: [:votable_id, :votable_type, :vote_direction]}

  belongs_to :voter, class_name: 'User'
  belongs_to :votable, polymorphic: true
end

#tested
