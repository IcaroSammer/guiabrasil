class Occupation < ApplicationRecord

  validates :name, :description , presence: :true
  
end
