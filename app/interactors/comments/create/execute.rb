module Comments
  class Create
    class Execute
      include Interactor

      delegate :user, :article, :comment_params, to: :context

      def call
        context.comment = comment

        context.fail!(error: "invalid params") unless comment.save
      end

      private

      def comment
        @comment = Comment.new(comment_params_merged)
      end

      def comment_params_merged
        comment_params.merge({user: user, article: article})
      end
    end
  end
end
