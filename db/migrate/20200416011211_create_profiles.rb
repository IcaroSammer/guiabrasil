class CreateProfiles < ActiveRecord::Migration[6.0]
	def change
		create_table :profiles do |t|

			t.string 	:name
			t.string 	:mobile_phone_number
			t.boolean 	:contact_by_whats_app
			t.boolean 	:active
			t.string 	:instagram
			t.string 	:facebook
			t.string 	:twitter
			t.string 	:linkedin
			t.string 	:user_type
			t.string 	:cpf
			t.string 	:rg_rne
			t.string 	:nacionality
			t.string 	:zip_code
			t.string 	:address
			t.string 	:neighbohood
			t.string 	:address_complement
			t.string 	:address_number
			t.string    :city
			t.string 	:state
			t.string 	:country
			t.date      :birthday
			t.string    :gender
			t.belongs_to :customer


			t.timestamps
		end

		add_index   :profiles, :cpf,                    unique: true

	end
end
