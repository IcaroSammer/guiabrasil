class AddReferenceTouristAttractionSurvey < ActiveRecord::Migration[6.0]
  def change
    add_reference :tourist_attraction_surveys, :tourist_attraction, index: true 
  end
end
