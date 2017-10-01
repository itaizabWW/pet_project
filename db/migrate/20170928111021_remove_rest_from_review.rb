class RemoveRestFromReview < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :rest, :string
  end
end
