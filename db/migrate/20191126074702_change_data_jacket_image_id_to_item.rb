class ChangeDataJacketImageIdToItem < ActiveRecord::Migration[5.2]
  def change
  	change_column :items, :jacket_image_id, :text
  end
end
