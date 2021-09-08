class AddEstablishmentHotel < ActiveRecord::Migration[6.0]
  def change
  	add_reference :hotels,:establishment, index: true
  end
end
