class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, :null => false
      t.integer :artist_id, :null => false
      t.boolean :format, :null => false
      t.string :jacket_image
      t.integer :genre_id, :null => false
      t.integer :label_id, :null => false
      t.integer :quantity, :null => false, :default => 1
      t.date :release_date, :null => false
      t.boolean :is_selling, :null => false
      t.datetime :created_at, :null => false, :default => 'now'
      t.datetime :updated_at, :null => false, :default => 'now'
      t.timestamps null: false
    end
  end
end
