class DeleteRichTextContentFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :rich_text_content
  end
end
