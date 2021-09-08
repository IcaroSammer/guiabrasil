class AddSpecialTypeAccommodationType < ActiveRecord::Migration[6.0]
  def change
  	add_column :accommodation_types, :special, :boolean
  end
end
