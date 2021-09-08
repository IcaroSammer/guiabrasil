class AddSurveyHotelOnHotel < ActiveRecord::Migration[6.0]
  def change
  	add_reference :hotel_surveys , :hotel, index: true
  end
end
