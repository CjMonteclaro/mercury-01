class GipiCommInvoice < ApplicationRecord

    octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "gipi_comm_invoice"
  self.primary_key = "intrmdry_intm_no"

  belongs_to :gipi_polbasic, foreign_key: :policy_id
  has_one :giis_intermediary, foreign_key: :intm_no
end
