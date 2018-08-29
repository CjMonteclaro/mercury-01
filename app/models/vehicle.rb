class Vehicle < ApplicationRecord
  belongs_to :brand
  has_many :quote_vehicles
end
