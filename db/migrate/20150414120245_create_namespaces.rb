class CreateNamespaces < ActiveRecord::Migration
  def change
    create_table :namespaces do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
