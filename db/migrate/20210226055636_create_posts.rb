class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :description
      t.string :subject
      t.string :grade
      t.string :meeting
      t.string :budget
      t.string :gender
      t.string :tutors_number
      t.string :commitment

      t.timestamps
    end
  end
end
