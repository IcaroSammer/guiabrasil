class AddReferencesRestaurantEstablishmentHour < ActiveRecord::Migration[6.0]
  def change
  	add_reference :establishment_opening_hours, :restaurant, index: true
  end
end
