class AddSlugToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :slug, :string
    add_index :addresses, :slug, unique: true
  end
end
