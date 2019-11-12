class RenameFirsrtNameColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :firsrt_name, :first_name
  end
end
