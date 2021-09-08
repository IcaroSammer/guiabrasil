class ChangeCollumnPricerangeRestaurants < ActiveRecord::Migration[6.0]
  def change
  	remove_column :restaurants,:price_range
  	add_column :restaurants,:price_range, :string
  end
end
