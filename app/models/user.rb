class User < ApplicationRecord
  has_many :quotes
  has_many :policies
  has_one :profile
end
