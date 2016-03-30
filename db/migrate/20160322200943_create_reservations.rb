class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.datetime :reservation_time

      t.timestamps null: false
    end
  end
end
