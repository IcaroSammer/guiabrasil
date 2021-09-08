class AddActiveToAccommodationSizes < ActiveRecord::Migration[6.0]
  def change
    add_column :accommodation_sizes, :active, :boolean
  end
end
