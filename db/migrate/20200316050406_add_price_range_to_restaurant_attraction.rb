class AddPriceRangeToRestaurantAttraction < ActiveRecord::Migration[6.0]
  def change
  	add_column :restaurants, :price_range, :string, array:true, default: []
  	add_column :tourist_attractions, :price_range, :string, array:true, default: []

  	remove_column :hotels, :payment_form, :string
  	remove_column :hotels, :accommodation_type, :string
  	remove_column :restaurants, :form_payment, :string
  	  	
  end
end
