class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :grade
      t.string :phone
      t.references :child

      t.timestamps
    end
  end
end
