class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :rich_text_content, null: false
      t.references :user, foreign_key: true
      t.string :state, default: "published", null: false

      t.timestamps
    end
  end
end
