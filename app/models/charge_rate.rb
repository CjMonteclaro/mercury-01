class ChargeRate < ApplicationRecord
  belongs_to :charge_type
  has_many :quote_charges
  has_many :quotes, through: :quote_charges

  def shortname
    self.charge_type.shortname
  end

end
