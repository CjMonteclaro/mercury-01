class Peril < ApplicationRecord
	has_many :quotes
	has_many :premiums
	has_many :quote_perils

end
