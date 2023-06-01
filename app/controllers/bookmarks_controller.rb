class BookmarksController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    current_user.bookmarked_articles << @article
    redirect_to @article, notice: "Article bookmarked!"
  end

  def destroy
    @article = Article.find(params[:article_id])
    current_user.bookmarked_articles.destroy(@article)
    redirect_to @article, notice: "Bookmark removed."
  end
end
