class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :grade
      t.string :subject
      t.string :password_digest
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
