class ChargeRate < ApplicationRecord
  belongs_to :charge_type
  has_many :quote_charges

  def self.vat
    self.find_by(charge_type: 1).rate
  end

  def dst
    self.where(charge_type: 2).rate
  end

  def lgt
    self.where(charge_type: 3).rate
  end

  def ra
    self.where(charge_type: 4).rate
  end

  def cocaf
    self.where(charge_type: 5).rate
  end

  def otf
    self.where(charge_type: 6).rate
  end
end
