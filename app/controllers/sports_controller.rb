class SportsController < ApplicationController
    def index
        @articles = Article.where(article_type: 'sport')
    end
end
