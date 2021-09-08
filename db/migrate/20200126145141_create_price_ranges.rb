class CreatePriceRanges < ActiveRecord::Migration[6.0]
  def change
    create_table :price_ranges do |t|
		t.decimal 	:range_init
		t.decimal 	:range_end
		t.string 	:description
		t.string 	:business_establishment, array:true, default: []
		t.boolean 	:active

      	t.timestamps
    end
  end
end
