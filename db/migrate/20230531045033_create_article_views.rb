class CreateArticleViews < ActiveRecord::Migration[7.0]
  def change
    create_table :article_views do |t|
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :view_count, default: 0

      t.timestamps
    end
  end
end
