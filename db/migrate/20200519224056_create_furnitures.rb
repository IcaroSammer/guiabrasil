class CreateFurnitures < ActiveRecord::Migration[6.0]
  def change
    create_table :furnitures do |t|
    	t.string :name
    	t.string :description
    	t.string :dimension
    	t.string :rooms, array:true, default: [] 

      t.timestamps
    end
  end
end
