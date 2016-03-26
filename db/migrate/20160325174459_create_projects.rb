class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_title
      t.string :project_url
      t.text :project_content
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps null: false
    end
  end
end
