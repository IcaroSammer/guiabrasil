class CreateCommfortClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :commfort_classifications do |t|
    	t.string :name, null: :false, default: ""
    	t.integer :number_of_star
      t.boolean :active, null: :false, default: :false
      t.string 	:business_establishment, array:true, default: []
      t.timestamps
    end
  end
end
