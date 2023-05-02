module Api
  module V1
    class CommentsController < Api::V1::BaseController
      before_action :authenticate_user!
      before_action :set_article
      before_action :set_comment, only: %i[update destroy]

      def create    
        if create_comment.success?
          render json: { msg: "comment created"}
        else
          render json: { msg: "comment not created", error: @comment.error.full_messages }
        end
      end
    
      def update
        if update_comment.success?
          render json: { msg: "comment updated" }
        else
          render json: { msg: update_comment.error }
        end
      end
    
      def destroy
        if destroy_comment.success?
          render json: { msg: "comment destroyed" }
        else
          render json: { msg: destroy_comment.error }
        end
      end
    
      private
    
      def set_comment
        @comment = @article.comments.find(params[:id])
      end
    
      def set_article
        @article = Article.find(params[:article_id])
      end
    
      def comment_params
        params.require(:comment).permit(:content)
      end
    
      def create_comment
        @create_comment ||= Comments::Create.call(article: @article,  comment_params: comment_params, user: current_user)
      end
    
      def update_comment
        @update_comment ||= Comments::Update.call(comment: @comment, comment_params: comment_params)
      end
    
      def destroy_comment
        @destroy_comment ||= Comments::Destroy.call(comment: @comment)
      end
    end    
  end
end
