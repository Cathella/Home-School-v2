class CreateDirections < ActiveRecord::Migration[6.1]
  def change
    create_table :directions do |t|
      t.string :landmark
      t.float :latitude
      t.float :longitude
      t.references :teacher

      t.timestamps
    end
  end
end
