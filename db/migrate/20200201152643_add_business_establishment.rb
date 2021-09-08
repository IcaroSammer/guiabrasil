class AddBusinessEstablishment < ActiveRecord::Migration[6.0]
  def change
  	add_column :rules, :business_establishment, :string , array:true, default: []
  end
end
