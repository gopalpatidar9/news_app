class FashionesController < ApplicationController
    def index
        @articles = Article.where(article_type: 'Fashiones')
    end
end
