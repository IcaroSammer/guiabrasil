class AddMainDishesRestaurantes < ActiveRecord::Migration[6.0]
  def change
  	add_column :chefs, :main_courses, :string , array:true, default: []
  end
end
