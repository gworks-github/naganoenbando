class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :disk_id, null: false
      t.integer :track_number
      t.string :name

      t.timestamps
    end
  end
end
