class Follow < ApplicationRecord

    belongs_to :follower, foreign_key: 'user_id', class_name: 'User', :dependent => :destroy
    belongs_to :following, foreign_key: 'following_id', class_name: 'User', :dependent => :destroy
    
end
