class AddActiveEstablishment < ActiveRecord::Migration[6.0]
  def change
  	add_column :establishments, :active, :boolean
  end
end
