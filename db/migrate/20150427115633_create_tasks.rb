class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :project, index: true
      t.string :title, null: false
      t.text :description, null: false
      t.integer :priority, null: false, default: 1
      t.boolean :done, null: false, default: 0
      t.datetime :date_end, null: false, default: DateTime.now
      t.timestamps null: false
    end
  end
end
