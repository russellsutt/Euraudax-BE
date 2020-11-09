class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :time, :pace, :archived, :user, :route, :comments, :attendees

  belongs_to :user
  belongs_to :route
  has_many :comments
  has_many :attendees
end
