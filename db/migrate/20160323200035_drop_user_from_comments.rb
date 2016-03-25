class DropUserFromComments < ActiveRecord::Migration
  def change
      remove_column :comments, :user_id
      remove_column :comments, :article_id
  end
end
