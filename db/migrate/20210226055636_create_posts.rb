class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :description
      t.string :subject
      t.string :grade
      t.string :meeting
      t.integer :budget
      t.string :gender
      t.integer :tutors_number
      t.string :commitment
      t.string :per_payment
      t.references :child, foreign_key: true

      t.timestamps
    end
  end
end
