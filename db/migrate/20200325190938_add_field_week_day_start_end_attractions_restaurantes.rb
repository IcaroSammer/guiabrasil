class AddFieldWeekDayStartEndAttractionsRestaurantes < ActiveRecord::Migration[6.0]
  def change
  	add_column :tourist_attractions,:week_days,:string, array:true, default: []
  	add_column :tourist_attractions,:start_1, :string, array:true, default: []
  	add_column :tourist_attractions,:start_2, :string, array:true, default: []
  	add_column :tourist_attractions,:end_1, :string, array:true, default: []
  	add_column :tourist_attractions,:end_2, :string, array:true, default: []

  	add_column :restaurants,:week_days,:string, array:true, default: []
  	add_column :restaurants,:start_1, :string, array:true, default: []
  	add_column :restaurants,:start_2, :string, array:true, default: []
  	add_column :restaurants,:end_1, :string, array:true, default: []
  	add_column :restaurants,:end_2, :string, array:true, default: []
  end
end

