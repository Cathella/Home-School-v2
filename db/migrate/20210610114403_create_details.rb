class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.string :phone
      t.references :teacher

      t.timestamps
    end
  end
end
