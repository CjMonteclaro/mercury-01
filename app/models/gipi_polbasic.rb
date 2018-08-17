class GipiPolbasic < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "gipi_polbasic"
  self.primary_key = "policy_id"

  alias_attribute :id, :policy_id
  alias_attribute :source, :iss_cd
  alias_attribute :sequence_no, :pol_seq_no

  belongs_to :giis_assured, foreign_key: :assd_no

  has_one :gipi_comm_invoice, foreign_key: :policy_id
  has_one :giis_intermediary, through: :gipi_comm_invoice, foreign_key: :intm_no

  def no
    "#{line_cd}-#{subline_cd}-#{source}-#{issue_yy}-#{proper_seq_no}-#{proper_renew_number}"
  end

  def proper_seq_no
    sprintf '%07d', sequence_no
  end

  def proper_renew_number
    sprintf '%02d', renew_no
  end


end
