class UserAdminAddFields < ActiveRecord::Migration[6.0]
  def change
  	add_column :admins, :name, :string
  	add_column :users, :name, :string
	add_column :admins, :phone_number, :string
  	add_column :users, :phone_number, :string
  	
  end
end
