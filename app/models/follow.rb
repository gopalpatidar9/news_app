class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # has_one :profile
  validates :follower_id, uniqueness: {scope: :followed_id}
  validates :followed_id, uniqueness: {scope: :follower_id}

end
