class AddUserIdToReview < ActiveRecord::Migration[5.1]
  def change
    change_table :reviews do |t|
      t.belongs_to :user
    end
  end

end
