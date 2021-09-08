class CreateTouristAttractionSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :tourist_attraction_surveys do |t|
    	t.datetime 	:survey_date
    	t.text 			:final_comments
    	t.decimal 	:final_rate
    	t.boolean 	:active

    	t.decimal 	:interest_socore  # De 1 a 5 
    	t.decimal 	:Sort_order_by_destination_score
    	t.decimal 	:shopping_score
			t.decimal 	:events_score
			t.decimal 	:cultural_centers_score
			t.decimal 	:historical_buildings_score
			t.decimal 	:strong_score
			t.decimal 	:churches_score
			t.decimal 	:museums_score
			t.decimal 	:parks_score
			t.decimal 	:state_parks_score
			t.decimal 	:national_parks_score
			t.decimal 	:thematic_parks_score
			t.decimal 	:tours_score
			t.decimal 	:beaches_score
			t.decimal 	:beach_tents_score
			t.decimal 	:adventure_tourism_score



      t.timestamps
    end

  add_column :hotel_surveys, :active, :boolean

  end
end
