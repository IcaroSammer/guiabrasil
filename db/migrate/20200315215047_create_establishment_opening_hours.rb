class CreateEstablishmentOpeningHours < ActiveRecord::Migration[6.0]
  def change
    create_table :establishment_opening_hours do |t|
    	t.string :day_of_week
    	t.string :hour_opening
    	t.string :hour_close
    	
      t.timestamps
    end
  end
end
