class Page < ApplicationRecord
  has_many :task_pages 
  has_many :tasks, through: :task_pages
end
