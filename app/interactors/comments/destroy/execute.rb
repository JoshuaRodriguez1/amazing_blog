module Comments
  class Destroy
    class Execute
      include Interactor

      delegate :comment, to: :context

      def call
        context.fail!(error: "comment not destroyed") unless comment.destroy
      end
    end
  end
end
