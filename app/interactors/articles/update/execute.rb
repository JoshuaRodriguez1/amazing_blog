module Articles
  class Update
    class Execute
      include Interactor

      delegate :article_params, :article, to: :context

      def call
        context.fail!(error: "Invalid") unless article.update(article_params)
      end
    end
  end
end
