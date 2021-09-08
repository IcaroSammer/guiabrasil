class AddSurveyRestaurents < ActiveRecord::Migration[6.0]
  def change
  	add_reference :surveys,:restaurant, index: true
  end
end
