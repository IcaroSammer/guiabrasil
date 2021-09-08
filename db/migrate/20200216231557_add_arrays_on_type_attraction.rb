class AddArraysOnTypeAttraction < ActiveRecord::Migration[6.0]
  def change
  	remove_column :hotels, :type_attractions, :string , array:true, default: []
  	add_column :tourist_attractions, :type_attractions, :string , array:true, default: []

  end
end
