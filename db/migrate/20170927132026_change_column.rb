class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:restaurants ,:rating, 0)
  end
end
