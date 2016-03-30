class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :movie
      t.references :user, index: true, foreign_key: true
      t.string :point

      t.timestamps null: false
    end
  end
end
