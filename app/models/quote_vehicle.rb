class QuoteVehicle < ApplicationRecord
  belongs_to :quote
  belongs_to :vehicle
end
