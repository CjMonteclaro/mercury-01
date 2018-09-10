class ClaimsTat < ApplicationRecord

  belongs_to :gicl_claim, foreign_key: :claim_id, optional: true

  def claim_no(id)
    GiclClaim.find(id).no
  end
end
