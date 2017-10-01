class AddRestToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :rest, :string
  end
end
