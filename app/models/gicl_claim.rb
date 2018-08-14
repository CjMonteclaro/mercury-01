class GiclClaim < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "gicl_claims"
  self.primary_key = "claim_id"

  alias_attribute :source, :iss_cd
  alias_attribute :sequence_no, :clm_seq_no

  belongs_to :giis_assured, foreign_key: :assd_no

  def no
    "#{line_cd}-#{subline_cd}-#{source}-#{clm_yy}-#{proper_seq_no}"
  end

  def proper_seq_no
    sprintf '%07d', sequence_no
  end

end
