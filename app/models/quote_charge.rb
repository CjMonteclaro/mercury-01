class QuoteCharge < ApplicationRecord
  belongs_to :quote
  belongs_to :charge_rate

  def compute_charges
    net_premium = self.quote.base_prem

    charges = []
    ChargeType.all.each do |type|
      type.shortname

      case self.charge_rate.rate_type
        when 'percentage'
          charge_amount = net_premium * self.charge_rate.rate
        when 'currency'
          charge_amount = self.charge_rate.rate
      end

      charges.push(charge_amount)
    end
    self.charge_amount = charges.sum

  end

end
