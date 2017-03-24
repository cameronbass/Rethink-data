class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.datetime :publication_date
      t.string :source
      t.string :abstract
      t.string :file
    end
  end
end
