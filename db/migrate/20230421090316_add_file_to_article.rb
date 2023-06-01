class AddFileToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :file, :string
  end
end
