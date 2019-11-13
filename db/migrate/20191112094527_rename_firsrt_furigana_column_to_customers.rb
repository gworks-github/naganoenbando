class RenameFirsrtFuriganaColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :firsrt_furighana, :first_furigana
  end
end
