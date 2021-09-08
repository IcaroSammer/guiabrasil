class FixedTouristAttraction < ActiveRecord::Migration[6.0]
  def change
  	remove_reference :tourist_attractions, :establishments, index: true
  	add_reference :tourist_attractions,:establishment, index: true
  end
end
