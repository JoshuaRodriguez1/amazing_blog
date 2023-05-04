module Articles
  class Create
    class CreateArticleTags
      include Interactor

      delegate :article, :tags, to: :context

      def call
        context.fail!(error: "tags not created") unless create_article_tags!.all?
      end

      private

      def create_article_tags!
        tags.select{ |e|  e.present? }.map do |tag_id|
          article_tag = ArticleTag.new(tag_id: tag_id.to_i, article: article)
          
          article_tag.save
        end
      end
    end
  end
end
