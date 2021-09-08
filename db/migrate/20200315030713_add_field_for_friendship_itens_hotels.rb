class AddFieldForFriendshipItensHotels < ActiveRecord::Migration[6.0]
  def change
  	add_column :hotels, :differentials, :string , array:true, default: []
  	add_column :restaurants, :differentials, :string , array:true, default: []
  	add_column :cities, :differentials, :string , array:true, default: []
  	add_column :tourist_attractions, :differentials, :string , array:true, default: []
  end
end
