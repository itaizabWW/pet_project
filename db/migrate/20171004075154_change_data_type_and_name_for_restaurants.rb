class ChangeDataTypeAndNameForRestaurants < ActiveRecord::Migration[5.1]
  def change
    rename_column :restaurants, :tenbis ,:ten_bis
    rename_column :restaurants, :max_delivery_time ,:max_delivery_time
  end
end
