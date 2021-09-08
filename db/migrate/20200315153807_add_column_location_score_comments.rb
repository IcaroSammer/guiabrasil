class AddColumnLocationScoreComments < ActiveRecord::Migration[6.0]
  def change
  	  add_column :hotel_surveys, :location_score_comments , :text
  end
end
