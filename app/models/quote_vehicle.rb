class QuoteVehicle < ApplicationRecord
  belongs_to :quote
  belongs_to :brand
  belongs_to :model

end
