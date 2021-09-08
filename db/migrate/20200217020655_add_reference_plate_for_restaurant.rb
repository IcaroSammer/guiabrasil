class AddReferencePlateForRestaurant < ActiveRecord::Migration[6.0]
  def change
  	add_reference :main_courses, :restaurant, index: true
  end
end
