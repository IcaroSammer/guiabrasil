class AddActiveMainCourse < ActiveRecord::Migration[6.0]
  def change
  	add_column :main_courses, :active, :boolean
  end
end
