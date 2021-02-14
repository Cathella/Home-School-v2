class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :grade
      t.string :place
      t.string :program

      t.timestamps
    end
  end
end
