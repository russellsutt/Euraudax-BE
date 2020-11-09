class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :event

  belongs_to :user
  belongs_to :event
end
