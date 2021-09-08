class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.string :name
      t.string :description
      t.boolean :active
      t.string :tag, array:true, default: []
      t.timestamps
    end
  end
end
