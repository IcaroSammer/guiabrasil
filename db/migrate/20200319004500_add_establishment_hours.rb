class AddEstablishmentHours < ActiveRecord::Migration[6.0]
  def change
  	add_column :establishments, :establishment_open_and_close, :string
  end
end
