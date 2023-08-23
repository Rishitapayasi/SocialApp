class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validate :self_follow, :unique_follower
 

  def unique_follower
    if Follow.exists?(follower_id: follower_id, followed_id: followed_id)
      errors.add(:base, "you are already following this user")
    end
  end

  def self_follow
    if (follower_id == followed_id)
      errors.add(:followed_id, "you cannot follow youself")
    end
  end


end
