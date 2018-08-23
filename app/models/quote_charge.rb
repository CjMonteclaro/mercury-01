class QuoteCharge < ApplicationRecord
  belongs_to :quote
  belongs_to :charge_rate

  before_save :compute_charge_amounts

  def compute_charge_amounts
    if charge_rate.rate_type == 'percentage'
         self.charge_amount = self.quote.base_prem * (self.charge_rate.rate/100)
    else
         self.charge_amount = self.charge_rate.rate
    end


  end
end
