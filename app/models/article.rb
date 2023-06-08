class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :file , dependent: :destroy
  mount_uploader :file, FileUploader
  #has_many :comments, dependent: :destroy
  has_many :article_views
  
  validates :title, presence: true
  validates :content, presence: true
  
  enum :article_type , {sport: 0, politics: 1, government: 2, education: 3, health: 4, environment: 5, economy: 6, business: 7, tech: 8, entertainment: 9, automobile: 10}  
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy 
  has_many :ratings, dependent: :destroy

  


  def average_rating
    if ratings.count > 0
      ratings.average(:value).round(1)
    else
      "No ratings yet"
    end
  end

  # has_many :follows, foreign_key: :followed_id, dependent: :destroy
  # has_many :followers, through: :follows, source: :follower
  
end
