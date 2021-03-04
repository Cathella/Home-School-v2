class AddSlugToDirections < ActiveRecord::Migration[5.2]
  def change
    add_column :directions, :slug, :string
    add_index :directions, :slug, unique: true
  end
end
