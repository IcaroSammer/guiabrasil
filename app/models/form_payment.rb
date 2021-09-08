class FormPayment < ApplicationRecord
	validates :name,  :business_establishment, presence: :true
end
