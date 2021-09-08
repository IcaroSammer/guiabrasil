class AddComentsSocialnetworkFields < ActiveRecord::Migration[6.0]
  def change

  	add_column :establishments, :facebook, :string
  	add_column :establishments, :linkedin, :string
  	add_column :establishments, :twitter, :string
  	add_column :establishments, :instagram, :string
  	add_column :establishments, :website, :string

		add_column :hotel_surveys, :structure_score_comments , :text
		add_column :hotel_surveys, :recreation_score_comments, :text
		add_column :hotel_surveys, :social_score_comments, :text
		add_column :hotel_surveys, :services_score_comments, :text
		add_column :hotel_surveys, :accomodation_score_comments, :text
		add_column :hotel_surveys, :acomodation_score_comments, :text

		add_column :restaurant_surveys, :couvert_comments, :text 
		add_column :restaurant_surveys, :starter_course_comments, :text 
		add_column :restaurant_surveys, :presentation_course_comments, :text 
		add_column :restaurant_surveys, :temperature_comments, :text 
		add_column :restaurant_surveys, :quality_comments, :text 
		add_column :restaurant_surveys, :baking_comments, :text 
		add_column :restaurant_surveys, :harmony_ingredients_comments, :text 
		add_column :restaurant_surveys, :seasoning_comments, :text 
		add_column :restaurant_surveys, :final_sensation_comments, :text 
		add_column :restaurant_surveys, :dessert_comments, :text 
		add_column :restaurant_surveys, :final_sensation_meal_comments, :text 

		add_column :tourist_attraction_surveys, :interest_socore_comments, :text
		add_column :tourist_attraction_surveys, :sort_order_by_destination_score_comments, :text
		add_column :tourist_attraction_surveys, :shopping_score_comments, :text
		add_column :tourist_attraction_surveys, :events_score_comments, :text
		add_column :tourist_attraction_surveys, :cultural_centers_score_comments, :text
		add_column :tourist_attraction_surveys, :historical_buildings_score_comments, :text
		add_column :tourist_attraction_surveys, :strong_score_comments, :text
		add_column :tourist_attraction_surveys, :churches_score_comments, :text
		add_column :tourist_attraction_surveys, :museums_score_comments, :text
		add_column :tourist_attraction_surveys, :parks_score_comments, :text
		add_column :tourist_attraction_surveys, :state_parks_score_comments, :text
		add_column :tourist_attraction_surveys, :national_parks_score_comments, :text
		add_column :tourist_attraction_surveys, :thematic_parks_score_comments, :text
		add_column :tourist_attraction_surveys, :tours_score_comments, :text
		add_column :tourist_attraction_surveys, :beaches_score_comments, :text
		add_column :tourist_attraction_surveys, :beach_tents_score_comments, :text
		add_column :tourist_attraction_surveys, :adventure_tourism_score_comments, :text

  end
end
