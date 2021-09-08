class AddCnpjEstablishment < ActiveRecord::Migration[6.0]
  def change
  	add_column :establishments, :cnpj, :string,  index: true,  unique: true
  	
  end
end
