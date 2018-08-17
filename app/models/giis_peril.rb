class GiisPeril < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "giis_peril"
  self.primary_key = "peril_cd"

  alias_attribute :name, :peril_name

  belongs_to :gicl_item_peril, foreign_key: :peril_cd, primary_key: :peril_cd

end
