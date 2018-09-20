class Model < ApplicationRecord
  has_one :brand
  has_many :vehicles
  has_many :quote_vehicles
end
