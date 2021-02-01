class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :grade
      t.string :guardian
      t.string :password_digest
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
