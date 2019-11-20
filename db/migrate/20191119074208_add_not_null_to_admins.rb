class AddNotNullToAdmins < ActiveRecord::Migration[5.2]
  def change
    change_column_null :admins, :name, false
  end
end
