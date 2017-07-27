class Comment < ActiveRecord::Base
  validates :commentable_type, :commenter_id, :commentable_id, :body {presence: true}

end
