class AddReferencesCityEstablishment < ActiveRecord::Migration[6.0]
  def change
  	add_reference :cities,:establishment, index: true
  end
end
