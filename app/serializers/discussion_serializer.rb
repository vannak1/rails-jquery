class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  has_one :user, serializer: DiscussionuserSerializer
  has_many :comments
end
