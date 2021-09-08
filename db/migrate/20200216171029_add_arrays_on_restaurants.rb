class AddArraysOnRestaurants < ActiveRecord::Migration[6.0]
  def change
  	add_column :restaurants, :speciality, :string , array:true, default: []
  	add_column :restaurants, :classification_comfort, :string , array:true, default: []
  	add_column :restaurants, :enviroment, :string , array:true, default: []
  	add_column :restaurants, :icon, :string , array:true, default: []
  	add_column :restaurants, :payment_type, :string , array:true, default: []
  end
end
