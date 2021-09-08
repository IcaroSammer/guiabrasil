class AddPaymentsFormToHotelRestaurantAtraction < ActiveRecord::Migration[6.0]
  def change
  	add_column :hotels, :payments_form, :string, array:true, default: []
  	add_column :restaurants, :payments_form, :string, array:true, default: []
  	add_column :tourist_attractions, :payments_form, :string, array:true, default: []
  end
end
