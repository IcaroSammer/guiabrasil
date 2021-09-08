class AddFieldBiomeRegionCities < ActiveRecord::Migration[6.0]
  def change
  	add_column :cities,:biome, :string
  	add_column :cities,:region, :string

  end
end
