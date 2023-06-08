class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :bookmark, :unbookmark]

  def index
    @articles = Article.all
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)
    if user_signed_in? 
    @profile = current_user.profile
    @articles_today = Article.where("DATE(created_at) = ?", Date.today)
    @articles_likes = Article.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC')
    @sport_articles = Article.where(article_type: 'sport')
    @politics_articles = Article.where(article_type: 'politics')
    @technology_articles = Article.where(article_type: 'tech')
    @government_articles = Article.where(article_type: 'government')
    @health_articles = Article.where(article_type: 'health')
    @business_articles = Article.where(article_type: 'business')
    @automobile_articles = Article.where(article_type: 'automobile')
    @education_articles = Article.where(article_type: 'education')
    @entertainment_articles = Article.where(article_type: 'entertainment')
    @environment_articles = Article.where(article_type: 'environment')
    @economy_articles = Article.where(article_type: 'economy')
    end
  end

  def show
    # @article = Article.find(params[:id])
    # @rating = current_user.ratings.build
    # @following = current_user.followers(@user)
    @article_view = @article.article_views.find_or_create_by(user: current_user)
    @article_view.increment!(:view_count)
  end

  
  def new
    @article = current_user.articles.build
    #@article.article_categories.build.build_category
  end

  def edit
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  def like
    @article = Article.find(params[:id])
    current_user.likes.create(article: @article)
    redirect_to @article
  end

  def unlike
    @article = Article.find(params[:id])
    current_user.likes.where(article: @article).destroy_all
    redirect_to root_path
  end

  def bookmark
    current_user.bookmarks.create(article: @article)
    redirect_to root_path
  end

  def unbookmark
    current_user.bookmarks.find_by(article: @article).destroy
    redirect_to @article
  end

  def my_article
    @my_article = current_user.articles
    @profile = current_user.profile 
  end

  def my_article_view
    @article = Article.find(params[:id])
    @article_view = @article.article_views.find_or_create_by(user: current_user)
    @article_view.increment!(:view_count)
    @article_views_by_day = @article.article_views.group_by_day(:created_at).count
    @article_views_by_month = @article.article_views.group_by_month(:created_at).count
    @article_views_data = @article.article_views.group_by_day(:created_at).count
  end

  def article_view 
    
  end
private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :article_type,:user_id,:file)
  end
end
  
