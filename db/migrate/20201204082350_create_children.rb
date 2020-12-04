class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :name
      t.string :phone
      t.string :grade
      t.string :guardian
      t.string :address
      t.string :password_digest

      t.timestamps
    end
  end
end
