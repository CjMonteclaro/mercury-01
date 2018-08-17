class GiisLossCtgry < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "giis_loss_ctgry"
  self.primary_key = "loss_cat_cd"

  alias_attribute :description, :loss_cat_des

  belongs_to :gicl_claim, foreign_key: :loss_cat_cd, primary_key: :loss_cat_cd
end
