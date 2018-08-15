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

["PC", "CV", "MC", "LTO"].each do |policy_type|
  case policy_type
  when "PC"
    ["Car", "SUV", "Private Van"].each do |subline|
      Subline.find_or_create_by(line_id: 1, name: subline, policy_type: policy_type)
    end
  when "CV"
    ["Pick-up", "Light Commercial", "Medium Commercial", "Heavy Commercial", "Trailer", "Private Bus"].each do |subline|
      Subline.find_or_create_by(line_id: 1, name: subline, policy_type: policy_type)
    end
  when "MC"
    Subline.find_or_create_by(line_id: 1, name: "Motorcycle", policy_type: policy_type)
  when "LTO"
    ["Touris Car", "Taxi, PUJ, Minibus", "Public Bus, Tourist Bus"].each do |subline|
      Subline.find_or_create_by(line_id: 1, name: subline, policy_type: policy_type)
    end
  end
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

puts "Generating Charges table ..."

ct = [
  ["Value Added Tax - Output", "VAT-Output", 12, "percentage"],
  ["Doc Stamps Tax", "DST", 12.5, "percentage"],
  ["Local Govt Tax", "LGT", nil],
  ["Roadside Assistance", "RA", 100, "currency"],
  ["COC Verification", "COCVF", 50.40, "currency"],
  ["Online Transaction Fee", "OTF", 10, "currency"]
]
ct.each do |n, s, r, t|
  charge = ChargeType.find_or_create_by(name: n, shortname: s)
  charge.charge_rates.find_or_create_by(rate: r, rate_type: t) if r.present?
end


puts "Done!"
