class GiacChkDisbursement < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "giac_chk_disbursement"
  self.primary_key = "payee_class_cd"

  belongs_to :giis_payee, foreign_key: :payee_class_cd, primary_key: :payee_class_cd
end
