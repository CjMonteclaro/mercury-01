class User < ApplicationRecord

  has_one :profile

  has_many :quotes
  has_many :policies

end
