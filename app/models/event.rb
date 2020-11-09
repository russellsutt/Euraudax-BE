class Event < ApplicationRecord
  
  belongs_to :user
  belongs_to :route

  has_many :comments
  has_many :attendees

end
