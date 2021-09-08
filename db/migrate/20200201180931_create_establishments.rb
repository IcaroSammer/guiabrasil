class CreateEstablishments < ActiveRecord::Migration[6.0]
  def change
    create_table :establishments do |t|
      t.integer :environment
      t.integer :comfort_classification
      t.text :final_comment
      t.string :contact
      t.string :email
      t.string :address
      t.string :name
      t.integer :final_note
      t.string :geolocalization
      t.string :reference_point
      t.string :owner
      t.string :telephone
      t.string :reservation_phone
      t.string :comments
	    t.string :business_establishment, array:true, default: []
      t.timestamps
    end
  end
end
