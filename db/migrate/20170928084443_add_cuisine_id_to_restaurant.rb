class AddCuisineIdToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :cuisine_id, :Integer
  end
end
