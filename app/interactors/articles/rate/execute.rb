module Articles
  class Rate
    class Execute
      include Interactor

      delegate :article, :user, :amount, to: :context

      def call
        content.fail!(error: "article not rated") unless article_rated?
      end

      private

      def article_rated?
        user.rate(article, amount)
      end
    end
  end
end
