class GipiPolbasic < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "gipi_polbasic"
  self.primary_key = "policy_id"

  alias_attribute :id, :policy_id
  alias_attribute :inception, :incept_date
  alias_attribute :expiry, :expiry_date
  alias_attribute :effectivity, :eff_date
  alias_attribute :issued, :issue_date
  alias_attribute :source, :iss_cd
  alias_attribute :sequence_no, :pol_seq_no

end
