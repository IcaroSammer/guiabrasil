class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
	  t.integer :couvert
      t.integer :starter_course
      t.integer :presentation_course
      t.integer :temperature 
      t.integer :quality
      t.integer :baking
      t.integer :harmony_ingredients
      t.integer :seasoning
      t.integer :final_sensation
      t.integer :dessert
      t.integer :final_sensation_meal
      t.boolean :active
      t.string :business_establishment, array:true, default: []
      t.timestamps
    end
  end
end
