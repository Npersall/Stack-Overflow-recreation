class Answer < ActiveRecord::Base
  validates :commenter_id, :question_id, :body, :best_answer {presence: true}
end
