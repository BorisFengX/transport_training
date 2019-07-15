require 'csv'

Team.destroy_all
csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filepath2    = File.dirname(__FILE__) + '/seeds/team.csv'
CSV.foreach(filepath2, csv_options) do |row|
Team.create(name: "#{row['name']}")
end
puts "created #{Team.all.length} teams"

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filepath2    = File.dirname(__FILE__) + '/seeds/user.csv'
CSV.foreach(filepath2, csv_options) do |row|
user = User.new(name: "#{row['name']}", code: "#{row['code']}", role: "#{row['role']}")
user.team = Team.find_by(name: "#{row['team']}")
user.save!
end
puts "created #{User.all.length} users"

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filepath2    = File.dirname(__FILE__) + '/seeds/domain.csv'
CSV.foreach(filepath2, csv_options) do |row|
Domain.create(name: "#{row['name']}")
end
puts "created #{Domain.all.length} domains"

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filepath2    = File.dirname(__FILE__) + '/seeds/competency.csv'
CSV.foreach(filepath2, csv_options) do |row|
competency = Competency.new(name: "#{row['name']}", level: "#{row['level']}")
competency.domain = Domain.find_by(name: "#{row['domain']}")
competency.save!
end
puts "created #{Competency.all.length} competencies"


csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filepath2    = File.dirname(__FILE__) + '/seeds/join.csv'
CSV.foreach(filepath2, csv_options) do |row|
join = Join.new(target_level: "#{row['target_level'].to_i}", real_level: "#{row['real_level'].to_i}", self_evaluate_level: "#{row['self_evaluate_level'].to_i}")
join.competency = Competency.find_by(name: "#{row['competency']}")
join.user = User.find_by(name: "#{row['user'].strip}")
join.save!
end
puts "created #{Join.all.length} joins"

# Supplier.destroy_all
# csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
# filepath1    = File.dirname(__FILE__) + '/seeds/suppliers_all_no_address_sorted.csv'
# CSV.foreach(filepath1, csv_options) do |row|
# supplier = Supplier.new(name: "#{row['name']}".downcase, uniq_name: "#{row['uniq_name']}", presence: "#{row['presence']}", dp: "#{row['dp']}", longitude: "#{row['longitude']}".to_f, latitude: "#{row['latitude']}".to_f, process: "#{row['process']}")
# supplier.zone = Zone.find_by(zone: "#{row['zone']}")
# supplier.save!
# end
# puts "created #{Supplier.all.length} suppliers"
