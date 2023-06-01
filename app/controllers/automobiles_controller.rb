class AutomobilesController < ApplicationController
    def index
        @articles = Article.where(article_type: 'Automobiles')
    end
end
