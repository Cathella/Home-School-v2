class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :user
      t.text :message

      t.timestamps
    end
  end
end
