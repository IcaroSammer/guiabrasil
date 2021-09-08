class AddFieldSpecialPerfectDayCities < ActiveRecord::Migration[6.0]
  def change
  	add_column :cities,:special, :boolean
  	add_column :cities,:perfect_day_remarks, :text
  	add_column :cities,:perfect_day, :boolean
  	
  end
end




