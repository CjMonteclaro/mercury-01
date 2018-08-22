class QuotePeril < ApplicationRecord

	belongs_to :quote
	belongs_to :peril, optional: true
	has_many :quote_peril_charges
	has_many :charge_rates, through: :quote_peril_charges

	before_save :compute_premium

	def compute_premium
		self.subline_id = quote.subline_id

		premium_table_reference = Premium.find_by(subline_id: quote.subline_id, peril_id: self.peril_id)
		self.premium_id = premium_table_reference.id

		net_premium = case premium_table_reference.prem_type
				when 'FIXED' then premium_table_reference.premium
				when 'PERCENTAGE' then (quote.coverage_limit * (premium_table_reference.premium / 100))
			end

		self.sum_insured = if premium_table_reference.coverage_limit.present?
			premium_table_reference.coverage_limit
		 else
		 	quote.coverage_limit
		 end

		self.base_prem = net_premium
		# self.total_charges = total_charges
		# self.gross_prem = gross
	end

end
