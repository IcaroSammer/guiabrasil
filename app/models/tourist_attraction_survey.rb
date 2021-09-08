class TouristAttractionSurvey < ApplicationRecord

  belongs_to :tourist_attraction

  validates :survey_date, :signage_score , presence: :true

end