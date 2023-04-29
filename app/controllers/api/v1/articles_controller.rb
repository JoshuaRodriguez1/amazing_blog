module Api
  module V1
    class ArticlesController < Api::V1::BaseController
      before_action :set_article, only: %i[show]
      before_action :set_tag, if: ->{ tag_name_param.present? }

      def index
        @articles = Article.all

        @articles = @tag.articles if @tag
        render json: @articles
      end

      def show
        render json: @article
      end

      private

      def set_article
        @article = Article.find(params[:id])
      end

      def tag_name_param
        params[:tagName]
      end

      def set_tag
        @tag = Tag.find_by(name: tag_name_param)
      end
    end
  end
end
