class CreateOccupations < ActiveRecord::Migration[6.0]
  def change
    create_table :occupations do |t|
    	t.string :name
    	t.string :description
    	t.boolean :active
      t.timestamps
    end
  end
end
