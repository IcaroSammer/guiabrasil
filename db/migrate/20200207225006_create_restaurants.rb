class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :comment
      t.integer :quant_start
      t.integer :classification_order
      t.time :star_hour
      t.time :end_hour
      t.boolean :active
      t.string :business_establishment, array:true, default: []
    end
  end
end
