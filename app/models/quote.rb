class Quote < ApplicationRecord

	belongs_to :subline
	belongs_to :premium, optional: true

	has_many :quote_perils
	accepts_nested_attributes_for :quote_perils, allow_destroy: true

	has_many :perils, through: :quote_perils

	has_many :quote_charges
	accepts_nested_attributes_for :quote_charges, allow_destroy: true


	has_many :charge_rates, through: :quote_charges

	before_save :default_coverage_duration

	def default_coverage_duration
	  self.coverage_duration = 1
	end

	def compute_premium

		net_premium = self.quote_perils.sum(&:base_prem)

		perils = self.perils.collect(&:shortname)
		peril_count = self.perils.count

		ChargeRate.all.each do |charge_rate|

			if perils.include?('CTPL') && peril_count == 1
				next if charge_rate.charge_type_id == 1 || charge_rate.charge_type_id == 2 || charge_rate.charge_type_id == 3 || charge_rate.charge_type_id == 4
			elsif perils.include?('CTPL') && peril_count > 1
				#Add all charges
			else
				next if charge_rate.charge_type_id == 5 || charge_rate.charge_type_id == 6
			end

			# qc = QuoteCharge.find_or_initialize_by(quote_id: self.id, charge_type_id: charge_rate.charge_type.id)

			#  if charge_rate.rate_type == 'percentage'
			# 	 qc.charge_amount = net_premium * (charge_rate.rate/100)
			#  else
			# 	 qc.charge_amount = charge_rate.rate
			#  end

			#  qc.charge_rate_id = charge_rate.id
			#  self.quote_charges << qc

			# if charge_rate.rate_type == 'percentage'
			# 	 self.quote_charges.charge_amount = net_premium * (charge_rate.rate/100)
			# else
			# 	 self.quote_charges.charge_amount = charge_rate.rate
			# end

			 # self.quote_charges.charge_rate_id = charge_rate.id
			 # self.quote_charges << qc
		end

		total_charges = self.quote_charges.sum(&:charge_amount)

		gross = net_premium + total_charges

		self.update(
			base_prem: net_premium,
			total_charges: total_charges,
			gross_prem: gross
		)
	end

end
