class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :date_begin
      t.date :date_end
      t.text :description
      t.boolean :status
      t.integer :user_id
      t.integer :namespace_id

      t.timestamps null: false
    end
    add_foreign_key :projects, :users
    add_foreign_key :projects, :namespaces
  end
end
