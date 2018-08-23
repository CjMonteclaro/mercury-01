class GiacDirectClaimPayt < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "giac_direct_claim_payts"
  self.primary_key = "gacc_tran_id"

  belongs_to :gicl_claim, foreign_key: :claim_id, primary_key: :claim_id
  has_one :giac_chk_disbursement, foreign_key: :gacc_tran_id
end
