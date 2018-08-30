class Model < ApplicationRecord
  belongs_to :brand
  has_many :vehicles

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
    	self.find_or_create_by(
  		brand_id: Brand.find_or_create_by(name: spreadsheet.cell(i,'B')).id,
  		name: spreadsheet.cell(i,'C')
    	)
    end
  end

end
