class GiisIntermediary < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "giis_intermediary"
  self.primary_key = "intm_no"

  alias_attribute :name, :intm_name
  alias_attribute :no, :intm_no

  has_many :gipi_comm_invoices, foreign_key: :intm_no
  has_many :gipi_polbasics, through: :gipi_comm_invoices, foreign_key: :policy_id
end
