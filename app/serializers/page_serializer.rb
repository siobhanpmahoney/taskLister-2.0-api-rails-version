class PageSerializer < ActiveModel::Serializer
  attributes :id, :path

  has_many :tasks
end
