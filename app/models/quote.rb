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

	def compute_base_premium

		update(base_prem: self.quote_perils.sum(&:base_prem),
					 coverage_limit: self.quote_perils.collect(&:sum_insured).max
					)

		# perils = self.perils.collect(&:shortname)
		# peril_count = self.perils.count

		# self.quote_charges.each do |qc|

		# 	# if perils.include?('CTPL') && peril_count == 1
		# 	# 	next if qc.charge_type_id == 1 || qc.charge_type_id == 2 || qc.charge_type_id == 3 || charge_rate.charge_type_id == 4
		# 	# elsif perils.include?('CTPL') && peril_count > 1
		# 	# 	#Add all charges
		# 	# else
		# 	# 	next if qc.charge_type_id == 5 || qc.charge_type_id == 6
		# 	# end

		# 	charge_rate_ids.each do |rate_id|
 	# 			qc.charge_rate_id	<< rate_id
		# 	end
		# end


	end

	def compute_charges_and_gross_prem
		quote_charges.each do |qc|
			qc.compute_charge_amount
		end
		total_charges = quote_charges.sum(&:charge_amount)
		update(total_charges: total_charges, gross_prem: base_prem + total_charges)
	end

	def compute_gross_prem
		# update(gross_prem: base_prem + total_charges)
	end

end
