class QuoteVehicle < ApplicationRecord
  belongs_to :quote
  belongs_to :vehicle
  has_one :brand, through: :vehicle
  has_one :model, through: :vehicle
end
