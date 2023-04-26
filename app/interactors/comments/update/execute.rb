module Comments
  class Update
    class Execute
      include Interactor

      delegate :comment, :comment_params, to: :context

      def call
        context.fail!(error: "invalid params") unless comment.update(comment_params)
      end
    end
  end
end
