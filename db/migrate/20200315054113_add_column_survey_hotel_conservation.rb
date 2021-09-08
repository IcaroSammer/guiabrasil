class AddColumnSurveyHotelConservation < ActiveRecord::Migration[6.0]
  def change
  	add_column :hotel_surveys, :conservation_score_comments , :text
  end
end
