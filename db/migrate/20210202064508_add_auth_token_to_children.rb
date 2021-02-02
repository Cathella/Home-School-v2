class AddAuthTokenToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :auth_token, :string
  end
end
