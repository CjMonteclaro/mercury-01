class Brand < ApplicationRecord
  has_many :vehicles
  has_many :models
end
