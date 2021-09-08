class ChangeTableCommfortName < ActiveRecord::Migration[6.0]
  def change
    rename_table :comforts, :commforts
  end
end
