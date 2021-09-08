class AddReferencesPublicationHotels < ActiveRecord::Migration[6.0]
  def change
  	add_reference :publications,:hotel, index: true
  end
end
