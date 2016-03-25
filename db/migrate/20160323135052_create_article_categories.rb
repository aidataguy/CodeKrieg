class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.integer :article_id
      t.integer :category_id
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps null: false
    end
  end
end
