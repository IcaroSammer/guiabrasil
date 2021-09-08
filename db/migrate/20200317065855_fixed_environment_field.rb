class FixedEnvironmentField < ActiveRecord::Migration[6.0]
  def change
  	add_column :restaurants, :environment, :string, array:true, default: []
  	remove_column :restaurants, :enviroment, :string, array:true, default: []
  end
end
