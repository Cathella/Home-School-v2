class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :landmark, null: false
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.references :teacher, foreign_key: true
      t.references :child, foreign_key: true

      t.timestamps
    end
  end
end
