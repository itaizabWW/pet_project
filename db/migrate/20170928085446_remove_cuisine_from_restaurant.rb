class RemoveCuisineFromRestaurant < ActiveRecord::Migration[5.1]
  def change
    remove_column :restaurants, :cuisine, :text
  end
end
