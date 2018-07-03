class User < ApplicationRecord

  has_many :task_users
  has_many :tasks, through: :task_users

  has_secure_password
  validates :username, presence: true
  validates :password, presence: true
  validates :username, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: true }

  def user_tasks
    self.tasks
  end
end
