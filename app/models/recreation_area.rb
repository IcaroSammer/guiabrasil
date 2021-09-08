class RecreationArea < ApplicationRecord
validates :name, :description, :order, presence: :true
end
