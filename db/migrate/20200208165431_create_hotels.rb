class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|

    	t.datetime 	:opening_date
    	t.datetime 	:major_renovation_date
    	t.integer 	:number_of_employees
    	t.decimal 	:confort_rating
    	t.text 		:classification_order
    	t.string 	:price_range
    	t.string 	:payment_form, array:true, default: []
    	t.string 	:environment
    	t.string 	:accommodation_type
    	t.string 	:special_accommodation_type
		t.boolean 	:has_convention_rooms
		t.integer 	:number_of_convetion_rooms
		t.integer 	:total_capacity_convention_romms
		t.boolean 	:has_bars 
		t.integer 	:number_of_bars
		t.boolean 	:has_restaurants
		t.integer  	:number_of_restaurants
		t.integer 	:number_of_accommodations
		t.string 	:type_of_accomodation, array:true, default: []
		t.string 	:rules, array:true, default: []
		t.text 	 	:sustainable_actions
		t.text 		:thecnological_innivations
		t.decimal 	:final_score_evaluation
		t.boolean 	:active




      t.timestamps
    end
  end
end
