class GiclItemPeril < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "gicl_item_peril"
  self.primary_key = "claim_id"

  belongs_to :gicl_claim, foreign_key: :claim_id
  has_one :giis_peril, foreign_key: :peril_cd, primary_key: :peril_cd
end
