class RatingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_article, only: [:create]
  
    def create
      @rating = current_user.ratings.build(rating_params)
      @rating.article = @article
      
      if @rating.save
        redirect_to @article, notice: 'Thank you for rating this Article!'
      else
        redirect_to @article, alert: 'Unable to rate the Article.'
      end
    end
  
    private
  
    def set_article
      @article = Article.find(params[:article_id])
    end
  
    def rating_params
      params.permit(:value) 
    end
  end
