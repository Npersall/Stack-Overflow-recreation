class Question < ActiveRecord::Base
  validates :author_id, :body, :title, {presence: true}

  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers

end
#tested
