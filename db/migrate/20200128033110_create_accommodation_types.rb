class CreateAccommodationTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :accommodation_types do |t|
	  t.string :name
      t.string :description
      t.boolean :active
      t.string :business_establishment, array:true, default: []
      t.timestamps
    end
  end
end
