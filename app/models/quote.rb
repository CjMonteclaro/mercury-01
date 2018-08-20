class Quote < ApplicationRecord

	belongs_to :subline
	belongs_to :premium, optional: true

	has_many :quote_perils
	accepts_nested_attributes_for :quote_perils, allow_destroy: true

	has_many :perils, through: :quote_perils

	before_save :default_coverage_duration

	def default_coverage_duration
	  self.coverage_duration = 1
	end

	def compute_premium
		self.update(
			base_prem: self.quote_perils.sum(&:base_prem),
			total_charges: self.quote_perils.sum(&:total_charges),
			gross_prem: self.quote_perils.sum(&:gross_prem)
		)
	end


end
