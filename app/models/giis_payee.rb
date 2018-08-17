class GiisPayee < ApplicationRecord

  octopus_establish_connection(adapter: "oracle_enhanced", database: "FGIC", host: "172.16.110.241", port: "1521", username: "CPI", password: "CPI12345!")

  self.table_name = "giis_payees"
  self.primary_key = "payee_class_cd"

  alias_attribute :no, :payee_no
  alias_attribute :class_code, :payee_class_cd

  has_many :giis_payee_classes, foreign_key: :payee_class_cd, primary_key: :payee_class_cd
  belongs_to :gicl_clm_loss_exp, foreign_key: :payee_class_cd, primary_key: :payee_class_cd

  def name
    "#{payee_first_name} #{payee_middle_name} #{payee_last_name}"
  end
end
