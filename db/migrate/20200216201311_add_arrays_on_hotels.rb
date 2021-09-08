class AddArraysOnHotels < ActiveRecord::Migration[6.0]
  def change
  	add_column :hotels, :accommodation_item, :string , array:true, default: []
  	add_column :hotels, :enviroment, :string , array:true, default: []
  	add_column :hotels, :recreation_area, :string , array:true, default: []
  	add_column :hotels, :structure, :string , array:true, default: []
  	add_column :hotels, :service, :string , array:true, default: []
  	add_column :hotels, :social_item, :string , array:true, default: []
  	add_column :hotels, :rule, :string , array:true, default: []
  	add_column :hotels, :comfort, :string , array:true, default: []
  	add_column :hotels, :lodging, :string , array:true, default: []
  end
end
