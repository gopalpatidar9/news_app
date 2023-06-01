class PoliticsController < ApplicationController
    def index
        @articles = Article.where(article_type: 'politics')
      end
end
