class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :discussions
  has_many :comments
end
