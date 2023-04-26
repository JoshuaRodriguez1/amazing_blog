class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i[create update destroy]
  before_action :set_comment, only: %i[update destroy]

  def create
    @comment = create_comment.comment
    authorize! @comment

    if create_comment.success?
      flash[:notice] = "Comment created"
    else
      @comment.errors.full_messages.each do |msg|
        flash[:alert] = msg
      end
    end

    redirect_to articles_path
  end

  def update
    authorize! @comment

    if update_comment.success?
      flash[:notice] = "Comment updated"
    else
      @comment.errors.full_messages.each do |msg|
        flash[:alert] = msg
      end
    end

    redirect_to articles_path
  end

  def destroy
    authorize! @comment

    if destroy_comment.success?
      flash[:notice] = "Comment deleted"
    else
      flash[:alert] = "Something went wrong"
    end

    redirect_to articles_path
  end

  private 

  def create_comment
    @create_comment ||= Comments::Create.call(article: @article, user: current_user, comment_params: comment_params)
  end

  def update_comment
    @create_comment ||= Comments::Update.call(comment: @comment, comment_params: comment_params)
  end

  def destroy_comment
    @destroy_comment ||= Comments::Destroy.call(comment: @comment)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment ||= @article.comments.find(params[:id])
  end
end
