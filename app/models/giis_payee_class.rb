class GiisPayeeClass < ApplicationRecord
  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "giis_payee_class"
  self.primary_key = "payee_class_cd"

  alias_attribute :class_code, :payee_class_cd
  alias_attribute :description, :class_desc

  belongs_to :gicl_clm_loss_exp, foreign_key: :payee_class_cd, primary_key: :payee_class_cd
  belongs_to :giis_payees, foreign_key: :payee_class_cd, primary_key: :payee_class_cd
end
