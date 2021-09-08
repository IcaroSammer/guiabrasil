class AddColumnRestaurantFormPayment < ActiveRecord::Migration[6.0]
  def change
  	add_column :restaurants, :form_payment, :string , array:true, default: []
  end
end
