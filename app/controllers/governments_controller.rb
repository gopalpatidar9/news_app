class GovernmentsController < ApplicationController
    def index
        @articles = Article.where(article_type: 'Governments')
    end
end
