class ClaimsTat < ApplicationRecord
  
  belongs_to :gicl_claim, foreign_key: :claim_id
end
