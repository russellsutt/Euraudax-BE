class RouteSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :distance, :elevation, :estimated_time, :polyline, :user, :events


  belongs_to :user
  has_many :events
end
