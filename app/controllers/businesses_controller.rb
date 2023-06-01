class BusinessesController < ApplicationController
    def index
        @articles = Article.where(article_type: 'Businesses')
    end
end
