class HealthsController < ApplicationController
    def index
        @articles = Article.where(article_type: 'Healths')
    end
end
