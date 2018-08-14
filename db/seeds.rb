puts "Generating Lines ... "

["MC", "FI", "PA", "EN"].each do |line|
  li = Line.find_or_create_by(shortname: line)
  li.name = case line
  when "MC" then "Motor"
  when "FI" then "Fire"
  when "PA" then "Personal Accident"
  when "EN" then "Engineering"
  end
  li.save!
end

puts "Generating Sublines ..."

["PC", "CV", "MC", "LTO"].each do |subline|
  sl = Subline.find_or_create_by(shortname: subline)
  sl.name = case subline
  when "PC" then "Private Car"
  when "CV" then "Commercial Vehicle"
  when "MC" then "Motorcycle"
  when "LTO" then "Land Tranportation Operator's"
  end
  sl.line_id = 1
  sl.save!
end

puts "Generating Perils ..."

["OD/TH", "AON", "SRCC", "THO", "FIO", "CTPL", "XBI", "XPD", "UPPA", "PV"].each do |peril|
  pr = Peril.find_or_create_by(shortname: peril)
  pr.name = case peril
  when "OD/TH" then "OD/Theft"
  when "AON" then "Acts of Nature"
  when "SRCC" then "Strikes, Riots, and Civil Commotion"
  when "THO" then "Theft Only"
  when "FIO" then "Fire Only"
  when "CTPL" then "Compulsory Third Party Liability"
  when "XBI" then "Extended Third Party Liability - BI/Death"
  when "XPD" then "Extended Third Party Liability - Property Damage"
  when "UPPA" then "Unnamed Passenger Personal Accident"
  when "PV" then "Political Violence"
  end
  pr.line_id = 1
  pr.save!
end

puts "Done!"
