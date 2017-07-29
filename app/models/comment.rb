class Comment < ActiveRecord::Base

  validates :commentable_type, :commenter_id, :commentable_id, :body, {presence: true}

  belongs_to :commenter, class_name: 'User'
  belongs_to :commentable, polymorphic: true


end
#tested
