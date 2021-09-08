class AddCompleteAddress < ActiveRecord::Migration[6.0]
  def change
  	add_column :establishments, :cep, :string
  	add_column :establishments, :street, :string
  	add_column :establishments, :complement, :string
  	add_column :establishments, :number_address, :string
  	add_column :establishments, :city, :string
  	add_column :establishments, :state, :string
  	add_column :establishments, :nationality, :string
  end
end
