class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :doer, index: true, foreign_key: true
      t.string :title
      t.string :details
      t.boolean :completed?
      t.timestamps null: false
    end
  end
end
