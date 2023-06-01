class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :file
  mount_uploader :file, FileUploader
  has_rich_text :content
  #has_many :comments, dependent: :destroy
  has_many :article_views
  
  validates :title, presence: true
  validates :content, presence: true
  
  enum article_type: [:sport, :politics, :government, :education, :health, :environment, :economy, :business, :tech, :entertainment, :automobile]  
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
