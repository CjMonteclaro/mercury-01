class Quote < ApplicationRecord

	belongs_to :subline
	belongs_to :premium, optional: true

	has_many :quote_perils
	accepts_nested_attributes_for :quote_perils, allow_destroy: true

	has_many :perils, through: :quote_perils

	has_many :quote_charges
	accepts_nested_attributes_for :quote_charges, allow_destroy: true

	has_many :charge_rates, through: :quote_charges

	has_many :quote_vehicles
	accepts_nested_attributes_for :quote_vehicles, allow_destroy: true

	has_many :vehicles, through: :quote_vehicles

	belongs_to :user, optional: true
	belongs_to :policy, optional: true

	before_save :default_coverage_duration

	def default_coverage_duration
	  self.coverage_duration = 1
	end

	def compute_base_premium
		update(base_prem: self.quote_perils.sum(&:base_prem),
					 coverage_limit: self.quote_perils.collect(&:sum_insured).max
					)
	end

	def compute_charges_and_gross_prem
		quote_charges.each do |qc|
			qc.compute_charge_amount
		end
		total_charges = quote_charges.sum(&:charge_amount)
		update(total_charges: total_charges, gross_prem: base_prem + total_charges)
	end


end
