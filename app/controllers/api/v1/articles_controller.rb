module Api
  module V1
    class ArticlesController < Api::V1::BaseController
      before_action :set_article, only: %i[show update destroy]
      before_action :set_tag, if: ->{ tag_name_param.present? }
      before_action :authenticate_user!, only: %i[create update destroy]
      before_action -> { authorize! Article }, only: %i[index show]

      def index
        @articles = Article.all

        @articles = @tag.articles if @tag
        @articles = Article.find_by(title: params[:title]) if params[:title]

        render json: @articles
      end

      def create
        @article = create_article.article
        authorize! @article

        if create_article.success?
          render json: { article: @article, msg: "article created successfully" }
        else
          render json: { msg: create_article.error }
        end
      end

      def update        
        authorize! @article

        if @article.update(article_params)
          render json: { article: @article, msg: "article updated" }
        else
          render json: { msg: "error" }
        end 
      end

      def destroy
        authorize! @article

        if @article.destroy
          render json: { article: @article, msg: "article destroyed" }
        else
          render json: { msg: "error" }
        end 
      end 

      def show
        render json: @article
      end

      private

      def set_article
        @article = Article.find(params[:id])
      end

      def article_params
        params.require(:article).permit(:title, :state, :content)
      end

      def tag_name_param
        params[:tagName]
      end

      def create_article
        @create_article ||= Articles::Create.call(article_params: article_params, user: current_user, tags: params[:article][:tags])
      end

      def set_tag
        @tag = Tag.find_by(name: tag_name_param)
      end
    end
  end
end
