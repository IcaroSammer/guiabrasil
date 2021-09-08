class CreateComforts < ActiveRecord::Migration[6.0]
  def change
    create_table :comforts do |t|
      t.string :name, null: :false, default: ""
      t.boolean :active, null: :false, default: :false
      t.timestamps
    end
  end
end
