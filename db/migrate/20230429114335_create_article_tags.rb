class CreateArticleTags < ActiveRecord::Migration[7.0]
  def change
    create_table :article_tags, id: false do |t|
      t.references :article
      t.references :tag
      
      t.timestamps
    end
  end
end
