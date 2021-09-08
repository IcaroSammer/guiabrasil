class AddColumnCities < ActiveRecord::Migration[6.0]
  def change
  	add_column :cities, :city, :string
  end
end
