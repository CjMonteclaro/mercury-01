class Model < ApplicationRecord
  belongs_to :make
  has_many :vehicles
end
