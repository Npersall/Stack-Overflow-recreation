class Question < ActiveRecord::Base
  validates :author_id, :body, :title {presence: true}

end
