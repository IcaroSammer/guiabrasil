class FixTouristAttractionFields < ActiveRecord::Migration[6.0]
  def change

  	remove_column :tourist_attractions, :type_attractions, :string
  	remove_column :tourist_attractions, :interest_poits, :string
  	remove_column :tourist_attractions, :price_range, :string

  	add_column :tourist_attractions, :type_attraction, :string
  	add_column :tourist_attractions, :interest_score,  :string
  	add_column :tourist_attractions, :price, :decimal
  	


  end
end
