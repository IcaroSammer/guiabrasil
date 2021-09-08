class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.text :text_apresantation
      t.string 	:best_experiences, array:true, default: []
      t.string :best_time
      t.string :how_find
      
      t.timestamps
    end
  end
end
