class AddActiveTouristAttractions < ActiveRecord::Migration[6.0]
  def change
  	add_column :tourist_attractions, :active, :boolean
  end
end
