class AddBusinessEstablishmentComfort < ActiveRecord::Migration[6.0]
  def change
  	add_column :comforts, :business_establishment, :string , array:true, default: []
  end
end
