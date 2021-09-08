class SocialItem < ApplicationRecord
	validates :name, :order, presence: :true
end
