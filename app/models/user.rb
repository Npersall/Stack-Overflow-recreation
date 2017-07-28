class User < ActiveRecord::Base
  validates :username,  :hashed_password, {presence: true}
  validates :email, {uniqueness: true}

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id
  has_many :comments, foreign_key: :commenter_id
  has_many :answered_questions, through: :answers, source: :question


 include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    return @user && @user.password == password
    nil
  end

end
#tested
