class AddColumnSurveyHotel < ActiveRecord::Migration[6.0]
  def change
  	add_column :hotel_surveys, :circulation_score_comments , :text
  end
end
