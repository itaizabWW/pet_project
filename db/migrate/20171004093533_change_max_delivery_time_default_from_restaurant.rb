class ChangeMaxDeliveryTimeDefaultFromRestaurant < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:restaurants ,:max_delivery_time, 0)
  end
end
