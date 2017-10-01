class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    change_table :reviews do |t|
      t.belongs_to :restaurant
      t.belongs_to :user

    end


    change_table :restaurants do |t|
      t.belongs_to :cuisine
      t.has_many :users , :through => :reviews
      t.has_many :reviews , dependent: destroy
    end

    change_table :users do |t|
      t.has_many :restaurants, :through => :reviews
      t.has_many :reviews, dependent: destroy
    end

  end
end

