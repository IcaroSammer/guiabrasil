class CreateMainCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :main_courses do |t|
      t.string :name
      t.string :description
      t.string :ingredients, array:true, default: []
      t.string :business_establishment, array:true, default: []
      t.timestamps
    end
  end
end
