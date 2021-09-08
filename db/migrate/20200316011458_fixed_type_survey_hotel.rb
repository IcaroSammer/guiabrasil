class FixedTypeSurveyHotel < ActiveRecord::Migration[6.0]
  def change
  	change_column :hotel_surveys, :location_score, :integer
  end
end
