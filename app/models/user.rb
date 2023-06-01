class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :articles,  dependent: :destroy
         enum role: { writer: 0, admin: 1 }  
         has_many :likes, dependent: :destroy
         has_many :bookmarks, dependent: :destroy
         has_many :article_views 
         has_many :ratings, dependent: :destroy
         has_one :profile           
         
         has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
         has_many :followees, through: :followed_users
         has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
         has_many :followers, through: :following_users
     
         
        #  # Unfollows the given user
        #  def unfollow(user)
        #    followings.find_by(followed_id: user.id).destroy
        #  end
         
        #  # Returns true if the current user is following the given user
        #  def following?(user)
        #    following_users.include?(user)
        #  end
       
end





































