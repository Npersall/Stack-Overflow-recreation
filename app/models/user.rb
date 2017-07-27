class User < ActiveRecord::Base
  validates :username,  :hashed_password {presence: true}
  validates :email {uniqueness: true}
end
