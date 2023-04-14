class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :car_name
      t.string :model
      t.integer :year
      t.string :color
      t.string :image
      t.integer :price

      t.timestamps
    end
  end
end
