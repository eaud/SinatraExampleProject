class AddSlugsToDoers < ActiveRecord::Migration
  def change
    add_column :doers, :slug, :string
  end
end
