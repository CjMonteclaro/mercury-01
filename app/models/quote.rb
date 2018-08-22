class Quote < ApplicationRecord

	belongs_to :subline
	belongs_to :premium, optional: true

	has_many :quote_perils
	accepts_nested_attributes_for :quote_perils, allow_destroy: true

	has_many :perils, through: :quote_perils

	has_many :quote_charges
	has_many :charge_rates, through: :quote_charges

	before_save :default_coverage_duration

	def default_coverage_duration
	  self.coverage_duration = 1
	end

	def compute_premium

		net_premium = self.quote_perils.sum(&:base_prem)
		dst = ((net_premium/4) * 0.50)
		vat = (net_premium * 0.12)
		lgt = (net_premium * 0.0075)
		cocvf = 50.40
		other_charges = 10
		rsa = 100

		perils = self.perils.collect(&:shortname)

		if perils.include?('CTPL')
			total_charges = dst + vat + lgt + rsa + cocvf + other_charges
		else
			total_charges = dst + vat + lgt + rsa
		end

		gross = net_premium + total_charges

		self.update(
			base_prem: self.quote_perils.sum(&:base_prem),
			total_charges: total_charges,
			gross_prem: gross
		)
	end

end
