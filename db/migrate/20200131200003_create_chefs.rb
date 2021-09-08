class CreateChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :description
      t.boolean :active
      t.string :business_establishment, array:true, default: []
      t.string :service_time
      t.timestamps
    end
  end
end
