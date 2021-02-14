class AddEmailConfirmColumnToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :email_confirmed, :boolean, :default => false
    add_column :teachers, :confirm_token, :string
  end
end
