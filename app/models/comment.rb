class Comment < ActiveRecord::Base

  validates :commentable_type, :commenter_id, :commentable_id, :body, {presence: true}
  validates :commenter_id, uniqueness: {scope: [:commentable_id, :commentable_type]}

  belongs_to :commenter, class_name: 'User'
  belongs_to :commentable, polymorphic: true


end
#tested
