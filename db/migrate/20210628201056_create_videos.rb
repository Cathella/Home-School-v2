class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :youtube
      t.string :grade
      t.string :subject
      t.text :description

      t.timestamps
    end
  end
end
