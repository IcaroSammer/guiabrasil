class AddtouristAttractionSurveys < ActiveRecord::Migration[6.0]
  def change
    add_column :tourist_attraction_surveys, :signage_score, :decimal    
    add_column :tourist_attraction_surveys, :signage_score_comments, :string

    add_column :tourist_attraction_surveys, :conservation_score, :decimal    
    add_column :tourist_attraction_surveys, :conservation_score_comments, :string
    
    add_column :tourist_attraction_surveys, :accessibility_score, :decimal    
    add_column :tourist_attraction_surveys, :accessibility_score_comments, :string
    
    add_column :tourist_attraction_surveys, :local_tour_guides_score, :decimal    
    add_column :tourist_attraction_surveys, :local_tour_guides_score_comments, :string
    
    add_column :tourist_attraction_surveys, :kindness_score, :decimal    
    add_column :tourist_attraction_surveys, :kindness_score_comments, :string
    
    add_column :tourist_attraction_surveys, :beauty_score, :decimal    
    add_column :tourist_attraction_surveys, :beauty_score_comments, :string
    
    add_column :tourist_attraction_surveys, :infrastructure_score, :decimal    
    add_column :tourist_attraction_surveys, :infrastructure_score_comments, :string
    
    add_column :tourist_attraction_surveys, :historical_importance_score, :decimal    
    add_column :tourist_attraction_surveys, :historical_importance_score_comments, :string
    
    add_column :tourist_attraction_surveys, :artistic_importance_score, :decimal    
    add_column :tourist_attraction_surveys, :artistic_importance_score_comments, :string
    
    add_column :tourist_attraction_surveys, :architectural_importance_score, :decimal    
    add_column :tourist_attraction_surveys, :architectural_importance_score_comments, :string    
    
    add_column :tourist_attraction_surveys, :natural_importance_score, :decimal    
    add_column :tourist_attraction_surveys, :natural_importance_score_comments, :string    
    
    add_column :tourist_attraction_surveys, :cultural_importance_score, :decimal    
    add_column :tourist_attraction_surveys, :cultural_importance_score_comments, :string    
    
    add_column :tourist_attraction_surveys, :economic_importance_score, :decimal    
    add_column :tourist_attraction_surveys, :economic_importance_score_comments, :string    

  end
end
