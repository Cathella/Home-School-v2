class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :youtube_id

      t.timestamps
    end
  end
end
