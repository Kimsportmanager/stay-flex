class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :users, null: false, foreign_key: true
      t.string :city
      t.text :neighborhood
      t.integer :room_number
      t.integer :bathroom_number
      t.integer :bed_number
      t.integer :max_ccupants
      t.integer :price
      t.string :room_pictures
      t.date :available_start_date
      t.date :available_end_date

      t.timestamps
    end
  end
end
