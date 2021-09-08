class FixingRegistersAllForTextAreas < ActiveRecord::Migration[6.0]
  def change
	change_column :icons, :description, :text
	change_column :chefs, :description, :text
	change_column :establishments, :comments, :text
	change_column :main_courses, :description, :text
	change_column :publications, :description, :text
	remove_column :establishments, :business_establishment, :string
	add_column :establishments, :business_establishment, :string
  end
end
