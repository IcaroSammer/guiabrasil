class ChangeFieldSpecialityRestaurants < ActiveRecord::Migration[6.0]
  def change
  	remove_column :restaurants,:speciality,:string
  	add_column :restaurants,:speciality, :string
  end
end
