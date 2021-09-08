class AddArraysOnHotelsTypeAttraction < ActiveRecord::Migration[6.0]
  def change
  	add_column :hotels, :type_attractions, :string , array:true, default: []
  end
end
