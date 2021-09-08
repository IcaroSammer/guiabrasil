class CreateEnterprises < ActiveRecord::Migration[6.0]
  def change
    create_table :enterprises do |t|
    	t.string :name
    	t.string :nick_name
    	t.string :cnpj
    	t.date   :foundation_date
    	t.string :economic_activity_code
    	t.string :economic_activity_description
    	t.string :company_size
    	t.string :secondary_economic_activities_code
    	t.string :secondary_economic_activities_description
    	t.string :legal_nature_code
    	t.string :legal_nature_description
    	t.string :address
    	t.string :address_complement
    	t.string :address_number
    	t.string :neighbohood
    	t.string :zip_code
    	t.string :city
    	t.string :state
    	t.string :country_code
    	t.string :country
    	t.string :phone_number
    	t.string :mobile_phone_number
    	t.boolean :active
    	t.string :email
    	t.string :enterprise_type
    	t.boolean :group_company
    	t.boolean :business_partner
    	t.string :user_updater, default: [], array: true
    	t.string :dates_updater, default: [], array: true
      	t.timestamps
    end
    add_index   :enterprises, :cnpj,                    unique: true
  end
end
