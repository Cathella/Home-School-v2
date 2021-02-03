class AddAuthTokenToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :auth_token, :string
  end
end
