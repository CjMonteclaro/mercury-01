class QuotePeril < ApplicationRecord

	belongs_to :quote
	belongs_to :peril, optional: true

	before_save :compute_premium

	def compute_premium
		premium_table_reference = Premium.find_by(subline_id: quote.subline_id, peril_id: self.peril_id)

		net_premium = case premium_table_reference.prem_type
			when 'FIXED' then premium_table_reference.premium
			when 'PERCENTAGE' then (quote.coverage_limit * (premium_table_reference.premium / 100))
			end

		dst = ((net_premium/4) * 0.50)
		vat = (net_premium * 0.12)
		lgt = (net_premium * 0.0075)
		cocaf = 50.40
		other_charges = 10
		rsa = 100

		if self.peril.shortname == 'CTPL'
			total_charges = cocaf + other_charges
		else
			total_charges = dst + vat + lgt + rsa
		end

		gross = net_premium + total_charges

		self.sum_insured = if premium_table_reference.coverage_limit.present?
			premium_table_reference.coverage_limit
		 else
		 	quote.coverage_limit
		 end

		self.base_prem = net_premium
		self.total_charges = total_charges
		self.gross_prem = gross
	end

end
