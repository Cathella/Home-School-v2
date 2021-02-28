class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :per_charge
      t.string :fee
      t.string :experience
      t.string :commitment
      t.string :description

      t.timestamps
    end
  end
end
