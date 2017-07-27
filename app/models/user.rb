class User < ActiveRecord::Base
  validates :username,  :hashed_password, {presence: true}
  validates :email, {uniqueness: true}

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id
  has_many :comments, foreign_key: :commenter_id

end
#tested
