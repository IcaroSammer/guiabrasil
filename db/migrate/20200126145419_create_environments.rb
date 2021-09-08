class CreateEnvironments < ActiveRecord::Migration[6.0]
  def change
    create_table :environments do |t|
	  	t.string :name
      t.boolean :active
      t.string :business_establishment, array:true, default: []
      t.timestamps
    end
  end
end
