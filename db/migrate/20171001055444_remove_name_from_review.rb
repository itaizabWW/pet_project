class RemoveNameFromReview < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :name, :string
  end
end
