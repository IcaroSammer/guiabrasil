class AddReferencesEstablishmentRestaurant < ActiveRecord::Migration[6.0]
  def change
  	add_reference :restaurants,:establishment, index: true
  end
end
