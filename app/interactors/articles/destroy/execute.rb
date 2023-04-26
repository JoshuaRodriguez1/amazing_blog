module Articles
  class Destroy
    class Execute
      include Interactor

      delegate :article, to: :context

      def call
        context.fail!(error: "Invalid") unless article.destroy
      end
    end
  end
end
