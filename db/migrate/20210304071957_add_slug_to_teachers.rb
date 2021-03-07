class AddSlugToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :slug, :string
    add_index :teachers, :slug, unique: true
  end
end
