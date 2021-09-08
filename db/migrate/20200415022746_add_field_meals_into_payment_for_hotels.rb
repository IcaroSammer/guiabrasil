class AddFieldMealsIntoPaymentForHotels < ActiveRecord::Migration[6.0]
  def change
  	add_column :hotels, :meal_included_price, :string , array:true, default: []
  end
end
