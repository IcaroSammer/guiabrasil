class CreateEstablishmentTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :establishment_terms do |t|
    	t.string :name
    	t.boolean :active
    	t.text :description 
    	t.string :type_term
    	t.datetime :publication_date
    	t.datetime :inactivated_date
    	t.string :publicated_by
    	t.string :link_term
    	t.string  :user_updater , array:true, default: []
  		t.string  :dates_updater , array:true, default: []  

      t.timestamps
    end
  end
end
