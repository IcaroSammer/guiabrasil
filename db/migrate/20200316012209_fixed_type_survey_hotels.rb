class FixedTypeSurveyHotels < ActiveRecord::Migration[6.0]
  def change
    change_column :hotel_surveys, :final_rate, :integer
    change_column :hotel_surveys, :circulation_score, :integer
    change_column :hotel_surveys, :conservation_score, :integer
    change_column :hotel_surveys, :structure_score, :integer
    change_column :hotel_surveys, :recreation_score, :integer
    change_column :hotel_surveys, :social_score, :integer
    change_column :hotel_surveys, :services_score, :integer
    change_column :hotel_surveys, :accomodation_score, :integer
    change_column :hotel_surveys, :acomodation_score, :integer
    change_column :hotel_surveys, :final_score, :integer
  end
end
