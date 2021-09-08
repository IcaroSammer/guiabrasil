class AddReferencesPublicationEstablishment < ActiveRecord::Migration[6.0]
  def change
  	add_reference :publications, :establishment, index: true
  end
end
