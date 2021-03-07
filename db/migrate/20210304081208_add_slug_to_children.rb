class AddSlugToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :slug, :string
    add_index :children, :slug, unique: true
  end
end
