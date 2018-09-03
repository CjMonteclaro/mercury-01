class Vehicle < ApplicationRecord
  belongs_to :model
  belongs_to :brand
  has_many :quote_vehicles

  def vehicle_name
    "#{self.brand.name} #{self.model.name} "
  end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      self.find_or_create_by(
      year_model: spreadsheet.cell(i,'A'),
      brand_id: Brand.find_or_create_by(name: spreadsheet.cell(i,'B')).id,
      model_id: Model.find_or_create_by(name: spreadsheet.cell(i,'C')).id
      )
    end
  end

end
