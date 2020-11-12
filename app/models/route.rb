class Route < ApplicationRecord

  belongs_to :user, optional: true

  has_many :events, :dependent => :destroy
  
end
