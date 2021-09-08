class AddClassificationToEstablishments < ActiveRecord::Migration[6.0]
  def change

  	add_column :restaurants, :category, :string
  	add_column :hotels, :category, :string
  	add_column :tourist_attractions, :category, :string
  	add_column :cities, :category, :string


  end
end
