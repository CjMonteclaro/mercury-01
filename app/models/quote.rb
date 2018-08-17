class Quote < ApplicationRecord

	belongs_to :subline
	belongs_to :premium
	has_many :quote_perils
	has_many :perils, through: :quote_perils

	before_save :compute_premium
	accepts_nested_attributes_for :quote_perils, allow_destroy: true


	def compute_premium
		premium_table = Premium.where(subline_id: self.subline_id, peril_id: self.peril_id).first

		net_premium = 
			case premium_table.prem_type
				when 'FIXED' then premium_table.premium
				when 'PERCENTAGE' then (self.coverage_limit * (premium_table.premium / 100))	
			end

		dst= ((net_premium/4) * 0.50)
		vat= (net_premium * 0.12)
		lgt= (net_premium * 0.0075)
		cocaf= 50.40
		other_charges= 10
		rsa= 100

		if self.peril.shortname == 'CTPL'
			total_charges = cocaf + other_charges
		else
			total_charges = dst + vat + lgt + rsa			
		end
		gross = net_premium + total_charges

		self.premium_id = premium_table.id
		self.base_prem = net_premium
		self.total_charges = total_charges
		self.gross_prem = gross

	end


end
