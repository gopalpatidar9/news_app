class TechnologyesController < ApplicationController
    def index
        @articles = Article.where(article_type: 'Technologyes')
    end
end
