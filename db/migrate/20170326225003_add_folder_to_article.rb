class AddFolderToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :folder, :string
  end
end
