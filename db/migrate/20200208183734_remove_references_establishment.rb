class RemoveReferencesEstablishment < ActiveRecord::Migration[6.0]
  def change
  	remove_reference :establishments, :restaurant, index: true
  end
end
