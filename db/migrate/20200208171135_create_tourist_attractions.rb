class CreateTouristAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :tourist_attractions do |t|
      t.string :interest_poits
      t.string :comment
      t.string :classification_order
      t.references :establishments, index: true

      t.timestamps
    end
  end
end
