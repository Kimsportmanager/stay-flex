class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :users, null: false, foreign_key: true
      t.references :rooms, null: false, foreign_key: true
      t.float :fees
      t.date :check_in_date
      t.date :check_out_date
      t.boolean :status

      t.timestamps
    end
  end
end
