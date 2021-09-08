class AddFieldTouristAttractionTime < ActiveRecord::Migration[6.0]
  def change
  	add_column :tourist_attractions,:start_hour, :time
  	add_column :tourist_attractions,:end_hour, :time
  	add_column :tourist_attractions,:price_comments, :string
  end
end
