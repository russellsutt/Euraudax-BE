class AttendeeSerializer < ActiveModel::Serializer
  attributes :id, :user, :event

  belongs_to :user
  belongs_to :event
end
