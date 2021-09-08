class CreatePaymentTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_types do |t|
    	t.string :name
    	t.string :brand 
    	t.string :business_establishment, array:true, default: []
			t.boolean :active
      t.timestamps
    end
  end
end
