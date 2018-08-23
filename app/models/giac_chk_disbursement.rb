class GiacChkDisbursement < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "giac_chk_disbursement"
  self.primary_key = "gacc_tran_id"

  belongs_to :giac_chk_disbursement, foreign_key: :gacc_tran_id

  def check_number
    "#{check_pref_suf}-#{check_no}"
  end
end
