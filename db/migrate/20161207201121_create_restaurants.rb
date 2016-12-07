class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :phone_number
      t.string :address, null: false
      t.string :link
      t.string :hours_of_op

      t.timestamps null: false
    end
  end
end
