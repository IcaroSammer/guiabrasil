class CreateAccommodationSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :accommodation_sizes do |t|
    	t.string :name
    	t.string :description
    	t.integer :number_of_guest
      t.timestamps
    end
  end
end
