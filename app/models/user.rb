class User < ApplicationRecord

    has_secure_password
    validates_uniqueness_of :username


    has_many :follows, :dependent => :destroy

    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower

    has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
    has_many :following, through: :following_relationships, source: :following

    has_many :routes, :dependent => :destroy

    has_many :events, :dependent => :destroy

    has_many :comments, :dependent => :destroy

    has_many :attendees, :dependent => :destroy
end
