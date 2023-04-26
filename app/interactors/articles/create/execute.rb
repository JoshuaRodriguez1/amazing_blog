module Articles
  class Create
    class Execute
      include Interactor

      delegate :article_params, :user, to: :context

      def call
        context.article = article

        context.fail!(error: "Invalid") unless article.save
      end

      private

      def article
        @article ||= Article.new(prepared_params)
      end

      def prepared_params
        article_params.merge({ user: user })
      end
    end
  end
end
