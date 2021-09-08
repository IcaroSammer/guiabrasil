class ChangeFieldBestExperienceType < ActiveRecord::Migration[6.0]
  def change
  	
  	change_column :cities, :best_experiences, :text
  end
end
