class Room < ApplicationRecord

  validates :name, :description , presence: :true

end
