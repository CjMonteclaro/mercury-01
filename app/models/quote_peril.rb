class QuotePeril < ApplicationRecord

	belongs_to :quote
	belongs_to :peril, optional: true
	belongs_to :premium, optional: true

	before_save :compute_premium

	def compute_premium
		self.subline_id = quote.subline_id

		premium_table_reference = Premium.find_by(subline_id: quote.subline_id, peril_id: self.peril_id)
		self.premium_id = premium_table_reference.id

	 	net_premium = case premium_table_reference.prem_type
			when 'FIXED' then premium_table_reference.premium
			when 'PERCENTAGE' then (self.sum_insured * (premium_table_reference.premium / 100))
		end

		self.sum_insured = if premium_table_reference.coverage_limit.present?
			premium_table_reference.coverage_limit
	  else
			self.sum_insured
		end

		self.base_prem = net_premium
		# self.total_charges = total_charges
		# self.gross_prem = gross
	end

	def peril_name
	  Peril.find(self.peril_id).name
	end

end
