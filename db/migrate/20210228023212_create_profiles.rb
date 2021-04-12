class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :per_charge
      t.integer :fee
      t.integer :experience
      t.string :commitment
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
