class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :cuisine
      t.decimal :rating
      t.boolean :tenbis
      t.string :address
      t.decimal :price
      t.decimal :maxDevTime

      t.timestamps
    end
  end
end
