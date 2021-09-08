class AddNeighborhoodToEstablishment < ActiveRecord::Migration[6.0]
  def change
  	add_column :establishments, :neighborhood, :string
  end
end
