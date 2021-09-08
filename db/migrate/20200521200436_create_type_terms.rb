class CreateTypeTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :type_terms do |t|

    	t.string :name
    	t.boolean :active
    	t.text	:description 
    	
      t.timestamps
    end
  end
end
