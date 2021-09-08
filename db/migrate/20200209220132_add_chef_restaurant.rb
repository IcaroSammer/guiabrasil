class AddChefRestaurant < ActiveRecord::Migration[6.0]
  def change
  	add_reference :chefs,:restaurant, index: true
  end
end
