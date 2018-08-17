class Subline < ApplicationRecord

  belongs_to :line
  has_many :quotes
  has_many :premiums

end
