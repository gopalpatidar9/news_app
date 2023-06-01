class AddArticleTypeToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :article_type, :string
  end
end
