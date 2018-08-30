class Vehicle < ApplicationRecord
  belongs_to :model
  has_many :quote_vehicles
end
