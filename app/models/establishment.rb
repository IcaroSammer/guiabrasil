class Establishment < ApplicationRecord
	has_one :restaurant
	has_many :hotels
	has_many :tourist_attractions

	validates :name,	 presence: :true 
	

	validate :validate_cnpj

	def cnpj_present?
		!cnpj_present?
	end

	def validate_cnpj
		if self.cnpj?
			cnpj = CNPJ.new(self.cnpj)
			errors.add(:cnpj, "Inválido") unless cnpj.valid?
		end
	end


end
