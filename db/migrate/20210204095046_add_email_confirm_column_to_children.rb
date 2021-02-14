class AddEmailConfirmColumnToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :email_confirmed, :boolean, :default => false
    add_column :children, :confirm_token, :string
  end
end
