class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :child, foreign_key: true
    end
  end
end
