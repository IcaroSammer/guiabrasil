class CreateBusinessEstablishments < ActiveRecord::Migration[6.0]
  def change
    create_table :business_establishments do |t|
      t.string :name
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
