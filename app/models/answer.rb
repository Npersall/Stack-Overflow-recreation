class Answer < ActiveRecord::Base
  validates :commenter_id, :question_id, :body,  {presence: true}

  belongs_to :commenter, class_name: 'User'
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :question

  def selected_answer(selected_answer)
    if self.id == selected_answer.id
      return true
    end
    false
  end

end

#tested
