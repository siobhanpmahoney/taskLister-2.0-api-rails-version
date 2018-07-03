class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :github_branch, :priority, :status_summary

  has_many :pages
  has_many :tags
  has_many :users
end
