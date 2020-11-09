class UserSerializer < ActiveModel::Serializer
  attributes :id, :password, :username, :firstname, :lastname, :city, :state, :bio, :pic, :followers, :following, :comments, :events, :attendees, :routes


  has_many :routes
  has_many :comments
  has_many :events
  has_many :attendees



  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

end
