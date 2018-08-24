class GiclClmLossExp < ApplicationRecord
  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "gicl_clm_loss_exp"
  self.primary_key = "claim_id"

  alias_attribute :payee_no, :payee_cd
  alias_attribute :class_code, :payee_class_cd

  belongs_to :gicl_claim, foreign_key: :claim_id
  
  has_many :giis_payees, foreign_key: :payee_class_cd, primary_key: :payee_class_cd
  has_many :giis_payee_classes, foreign_key: :payee_class_cd, primary_key: :payee_class_cd
end
