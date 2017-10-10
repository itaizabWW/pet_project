class RemovePriceFromRestaurant < ActiveRecord::Migration[5.1]
  def change
    remove_column :restaurants, :price, :decimal
  end
end
