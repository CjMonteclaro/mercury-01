class Premium < ApplicationRecord

  has_many :sublines
  has_many :perils
  has_many :quote_perils
  has_many :quotes, through: :quote_perils


  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
    	self.find_or_create_by(
  		subline_id: Subline.find_or_create_by(name: spreadsheet.cell(i,'C')).id,
  		subline_factor: spreadsheet.cell(i,'C'),
  		peril_id: Peril.find_or_create_by(shortname: spreadsheet.cell(i,'B')).id,
  		coverage_limit: spreadsheet.cell(i,'D'),
  		coverage_duration: spreadsheet.cell(i,'E'),
  		premium: spreadsheet.cell(i,'F'),
  		prem_type: spreadsheet.cell(i,'G'),
  		taxed: spreadsheet.cell(i,'H').to_s
    	)

    end

  end

  def sublinename
  	Subline.where(id: self.subline_id).collect(&:policy_type).first
  end

  def perilname
  	Peril.where(id: self.peril_id).collect(&:shortname).first
  end

  def self.coverage_label
    Premium.all.where(subline_id: '1', peril_id: '7').collect(&:coverage_limit)
  end

end
