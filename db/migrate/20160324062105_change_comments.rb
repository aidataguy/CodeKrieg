class ChangeComments < ActiveRecord::Migration
  def change
    drop_table :article_comments
    add_reference :comments, :article, index: true, foreign_key: true
  end
end
