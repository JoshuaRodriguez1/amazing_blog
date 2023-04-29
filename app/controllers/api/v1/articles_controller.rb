module Api
  module V1
    class ArticlesController < Api::V1::BaseController
      before_action :set_article, only: %i[show]

      def index
        @articles = Article.all
        render json: @articles
      end

      def show
        render json: @article
      end

      private

      def set_article
        @article = Article.find(params[:id])
      end
    end
  end
end
