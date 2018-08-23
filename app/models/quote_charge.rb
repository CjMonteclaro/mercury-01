class QuoteCharge < ApplicationRecord
  belongs_to :quote
  belongs_to :charge_rate
  belongs_to :charge_type, optional: true

  before_save :populate#, :compute_charge_amounts

  def populate
    self.charge_type_id = self.charge_rate.charge_type_id
    self.charge_type_id = self.charge_rate.id
  end

  def compute_charge_amount
    if charge_rate.rate_type == 'percentage'
      charge_amount = self.quote.base_prem * (self.charge_rate.rate/100)
    else
      charge_amount = self.charge_rate.rate
    end
    update(charge_amount: charge_amount)
  end

end
