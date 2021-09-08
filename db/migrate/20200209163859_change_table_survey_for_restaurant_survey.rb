class ChangeTableSurveyForRestaurantSurvey < ActiveRecord::Migration[6.0]
  def change
  	
   		rename_table :surveys, :restaurant_surveys
  	
  end
end
