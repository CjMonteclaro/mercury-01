class GiisClmStat < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "giis_clm_stat"
  self.primary_key = "clm_stat_cd"

  alias_attribute :status, :clm_stat_cd
  alias_attribute :description, :clm_stat_desc

  belongs_to :gicl_claim, foreign_key: :clm_stat_cd, primary_key: :clm_stat_cd
end
