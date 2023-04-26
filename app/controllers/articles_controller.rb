class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :set_articles, only: %i[index create update]
  before_action ->{ authorize! Article }, only: %i[index show]

  def index
    @article = Article.new
  end

  def show
  end

  def create
    @article = create_article.article
    authorize! @article

    if create_article.success?
      flash[:notice] = "Article created successfully"
    else
      @article.errors.full_messages.each do |msg|
        flash[:alert] = msg
      end
    end
    redirect_to articles_path
  end

  def edit
    authorize! @article
  end

  def update
    authorize! @article

    if update_article.success?
      flash[:notice] = "Article updated successfully"
      redirect_to articles_path
    else
      flash[:alert] = "Something whent wrong"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! @article
  
    if destroy_article.success?
      flash[:notice] = "Article deleted successfully"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to articles_path
  end

  def publish
    @article = Article.find(params[:article_id])
    authorize! @article

    if @article.update(state: "published")
      flash[:notice] = "Article published"
    else
      flash[:alert] = "Something went wrong"
    end

    redirect_to dashboard_path
  end

  def unpublish
    @article = Article.find(params[:article_id])
    authorize! @article

    if @article.update(state: "draft")
      flash[:notice] = "Article returned to draft"
    else
      flash[:alert] = "something went wrong"
    end

    redirect_to dashboard_path
  end

  private

  def set_articles
    @articles = Article.published.with_rich_text_content
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :state)
  end

  def create_article
    @create_article ||= Articles::Create.call(article_params: article_params, user: current_user)
  end

  def update_article
    @update_article ||= Articles::Update.call(article_params: article_params, article: @article)
  end

  def destroy_article
    @destroy_article ||= Articles::Destroy.call(article: @article)
  end
end
