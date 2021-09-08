class AddRestaurantEstablishment < ActiveRecord::Migration[6.0]
  def change
  	add_reference :establishments, :restaurant, index: true
  end
end
