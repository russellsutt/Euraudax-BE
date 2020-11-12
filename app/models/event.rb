class Event < ApplicationRecord
  
  belongs_to :user
  belongs_to :route

  has_many :comments, dependent: :destroy
  has_many :attendees, dependent: :destroy

end
