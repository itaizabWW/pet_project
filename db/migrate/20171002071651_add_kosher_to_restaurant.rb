class AddKosherToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :kosher, :boolean
  end
end
