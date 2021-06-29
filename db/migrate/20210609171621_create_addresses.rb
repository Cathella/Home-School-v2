class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :landmark
      t.float :latitude
      t.float :longitude
      t.references :child

      t.timestamps
    end
  end
end
