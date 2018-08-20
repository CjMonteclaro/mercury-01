class Peril < ApplicationRecord
	has_many :premiums
	has_many :quote_perils
	has_many :quotes, through: :quote_perils

end
