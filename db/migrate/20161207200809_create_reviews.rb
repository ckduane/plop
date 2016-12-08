class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :outlet_rating, null: false
      t.integer :wifi_rating, null: false
      t.integer :seating_rating, null: false
      t.integer :parking_rating, null: false
      t.integer :atmosphere_rating, null: false
      t.integer :user_id, null: false
      t.integer :restaurant_id, null: false
      t.text :comments, null: false

      t.timestamps null: false
    end
  end
end
